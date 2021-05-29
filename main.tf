provider "google" {
  project = var.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# Add a new subnet with secondary IPs
resource "google_compute_subnetwork" "apm-subnet" {
  name          = "apm-subnet"
  ip_cidr_range = "172.16.0.0/16"
  region        = var.gcp_region
  network       = "default"
  secondary_ip_range = [{ 
    range_name    = "admin-cluster-pods"
    ip_cidr_range = "172.20.0.0/14"
  },
  { 
    range_name    = "user-cluster-pods"
    ip_cidr_range = "172.24.0.0/14"
  },
  { 
    range_name    = "admin-cluster-services"
    ip_cidr_range = "172.28.0.0/20"
  },
  { 
    range_name    = "user-cluster-services"
    ip_cidr_range = "172.28.16.0/20"
  }]
}


# Build the admin workstation
resource "google_compute_instance" "admin-workstation" {
  name         = "admin-workstation"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 200
    }
  }

  metadata_startup_script = file("startup.sh")

  metadata = {
    ssh-keys = "root:${file(var.ssh_pub_key)}"
  }

  network_interface {
    network     = "default"
    subnetwork  = google_compute_subnetwork.apm-subnet.self_link
    access_config {
    }
  }

  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}

# Build the admin master
resource "google_compute_instance" "admin-cluster-master" {
  name         = "admin-cluster-master"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")
    
  metadata = {
    ssh-keys = "root:${file(var.ssh_pub_key)}"
  }

  network_interface {
    network = "default"
    subnetwork  = google_compute_subnetwork.apm-subnet.self_link
    access_config {
    }
  }

  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}

# Build the admin workers
resource "google_compute_instance" "admin-cluster-workers" {
  count        = 2 
  name         = "admin-cluster-worker${count.index}"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")
    
  metadata = {
    ssh-keys = "root:${file(var.ssh_pub_key)}"
  }

  network_interface {
    network = "default"
    subnetwork  = google_compute_subnetwork.apm-subnet.self_link
    access_config {
    }
  }
  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}

# Build the user master
resource "google_compute_instance" "user-cluster-master" {
  name         = "user-cluster-master"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")
  
  metadata = {
    ssh-keys = "root:${file(var.ssh_pub_key)}"
  }
  
  network_interface {
    network = "default"
    subnetwork  = google_compute_subnetwork.apm-subnet.self_link
    access_config {
    }
  }
  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}

# Build the user workers
resource "google_compute_instance" "user-cluster-workers" {
  count        = 3
  name         = "user-cluster-worker${count.index}"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")
  
  metadata = {
    ssh-keys = "root:${file(var.ssh_pub_key)}"
  }

  network_interface {
    network = "default"
    subnetwork  = google_compute_subnetwork.apm-subnet.self_link
    access_config {
    }
  }
  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
} 

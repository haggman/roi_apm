provider "google" {
  project = var.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
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

  network_interface {
    network = "default"
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

  network_interface {
    network = "default"
    access_config {
    }
  }
  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}
/*
# Build the admin workers
resource "google_compute_instance" "admin-cluster-workers" {
  count        = 1
  name         = "admin-cluster-worker${count.index}"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = var.base_image
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
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

  network_interface {
    network = "default"
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

  network_interface {
    network = "default"
    access_config {
    }
  }
  service_account {
    email  = var.vm_sa
    scopes = ["cloud-platform"]
  }
}
*/
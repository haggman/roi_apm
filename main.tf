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
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the admin master
resource "google_compute_instance" "admin-cluster-master" {
  name         = "admin-cluster-master"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the admin worker1
resource "google_compute_instance" "admin-cluster-worker1" {
  name         = "admin-cluster-worker1"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the user master
resource "google_compute_instance" "user-cluster-master" {
  name         = "user-cluster-master"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the user worker1
resource "google_compute_instance" "user-cluster-worker1" {
  name         = "user-cluster-worker1"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the user worker2
resource "google_compute_instance" "user-cluster-worker2" {
  name         = "user-cluster-worker2"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Build the user worker3
resource "google_compute_instance" "user-cluster-worker3" {
  name         = "user-cluster-worker3"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2004-focal-v20210511"
      size  = 100
    }
  }

  metadata_startup_script = file("startup.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }
}


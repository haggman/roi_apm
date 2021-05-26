provider "google" {
  project = "var.project_id"
  region  = "var.gcp_region"
  zone    = "var.gcp_zone"
}

# Build the admin workstation
resource "google_compute_instance" "vm_instance" {
  name         = var.admin_workstation
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
      size  = 100
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}


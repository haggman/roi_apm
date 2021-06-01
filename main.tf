provider "google" {
  project = var.project_id
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# Create the vxlan firewall
resource "google_compute_firewall" "allow-vxlan" {
  name    = "allow-vxlan"
  network = "default"

  allow {
    protocol = "udp"
    ports    = ["4789", "8472"]
  }
  source_ranges = ["0.0.0.0/0"]
}

# Add a new subnet
resource "google_compute_subnetwork" "apm-subnet" {
  name          = "apm-subnet"
  ip_cidr_range = "172.16.0.0/24"
  region        = var.gcp_region
  network       = "default"
  
}

locals {
  vm_settings = {
    "admin-workstation"     = { name = "admin-workstation"},
    "admin-cluster-master"  = { name = "admin-cluster-master"},
    "admin-cluster-worker0" = { name = "admin-cluster-worker0"},
    "admin-cluster-worker1" = { name = "admin-cluster-worker1"}
  }
}

# Build the VMs
resource "google_compute_instance" "map" {
    for_each     = local.vm_settings
    name         = each.value.name
    machine_type = "n1-highmem-8"

    boot_disk {
        initialize_params {
        image = var.base_image
        size  = 256
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

    shielded_instance_config {
        enable_secure_boot            = false
        enable_vtpm                   = false
        enable_integrity_monitoring   = false
    }
}
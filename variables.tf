variable "project_id" {
    description = "The project ID that will host the APM env"
    default     = ""
}

variable "gcp_region" {
    description = "GCP Region"
    default     = "us-central1"
}

variable "gcp_zone" {
    description = "GCP Zone"
    default     = "us-central1-a"
}

variable "admin_workstation" {
    description = "Name of the admin workstation VM"
    default     = "admin-workstation"
}
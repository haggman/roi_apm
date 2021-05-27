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

variable "base_image" {
    description = "Base os image to use for all created machines"
    default     = "ubuntu-2004-focal-v20210510" #Thats Ubuntu 20.04 LTS
}

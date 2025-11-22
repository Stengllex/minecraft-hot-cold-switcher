variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type    = string
  default = "europe-west4"
}

variable "zone" {
  type    = string
  default = "europe-west4-a"
}

variable "network_name" {
  type    = string
  default = "default"
}

variable "tags" {
  type    = list(string)
  default = ["minecraft"]
}

variable "hot_machine_type" {
  type    = string
  default = "n4d-highmem-2"
}

variable "cold_machine_type" {
  type    = string
  default = "n4d-standard-2"
}

variable "boot_disk_size_gb" {
  type    = number
  default = 10
}

variable "world_disk_size_gb" {
  type    = number
  default = 50
}

variable "image" {
  type    = string
  default = "debian-cloud/debian-12"
}

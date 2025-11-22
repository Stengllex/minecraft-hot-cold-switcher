variable "server_name" {
  type        = string
  description = "Name of the VM"
}

variable "machine_type" {
  type        = string
  description = "GCP machine type"
}

variable "zone" {
  type        = string
}

variable "tags" {
  type        = list(string)
  default     = []
}

variable "boot_disk_size" {
  type        = number
  default     = 10
}

variable "network_name" {
  type        = string
  default     = "default"
}

variable "image" {
  type        = string
  default     = "projects/debian-cloud/global/images/family/debian-12"
}


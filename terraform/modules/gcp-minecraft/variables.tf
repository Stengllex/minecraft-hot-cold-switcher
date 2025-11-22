variable "server_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "boot_disk_size" {
  type    = number
  default = 10
}

variable "attached_disk_ids" {
  type    = list(string)
  default = []
}

variable "network_name" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "zone" {
  type = string
}


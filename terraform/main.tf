# Persistent world disk (shared)
resource "google_compute_disk" "world_disk" {
  name  = "minecraft-world"
  zone  = var.zone
  type  = "hyperdisk-balanced"
  size  = 50
  labels = {
    purpose = "minecraft-world"
  }
}

# Hot VM
module "minecraft_hot" {
  source           = "./modules/gcp-minecraft"
  server_name      = "minecraft-hot"
  machine_type     = var.hot_machine_type
  boot_disk_size   = var.boot_disk_size_gb
  network_name     = var.network_name
  tags             = var.tags
  zone             = var.zone
}

# Cold VM
module "minecraft_cold" {
  source           = "./modules/gcp-minecraft"
  server_name      = "minecraft-cold"
  machine_type     = var.cold_machine_type
  boot_disk_size   = var.boot_disk_size_gb
  network_name     = var.network_name
  tags             = var.tags
  zone             = var.zone
}


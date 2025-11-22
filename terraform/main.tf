# Shared Minecraft world disk
resource "google_compute_disk" "minecraft_world" {
  name  = "minecraft-world-disk"
  type  = "pd-ssd"
  zone  = var.zone
  size  = var.world_disk_size_gb
}

# Hot VM
module "minecraft_hot" {
  source          = "./modules/gcp-minecraft"
  server_name     = "minecraft-hot"
  machine_type    = var.hot_machine_type
  boot_disk_size  = var.boot_disk_size_gb
  attached_disk_ids = [google_compute_disk.minecraft_world.id]
  network_name    = var.network_name
  tags            = var.tags
  zone            = var.zone
}

# Cold VM
module "minecraft_cold" {
  source          = "./modules/gcp-minecraft"
  server_name     = "minecraft-cold"
  machine_type    = var.cold_machine_type
  boot_disk_size  = var.boot_disk_size_gb
  attached_disk_ids = [google_compute_disk.minecraft_world.id]
  network_name    = var.network_name
  tags            = var.tags
  zone            = var.zone
}


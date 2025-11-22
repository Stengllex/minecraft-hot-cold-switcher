output "hot_ip" {
  value = module.minecraft_hot.public_ip
}

output "cold_ip" {
  value = module.minecraft_cold.public_ip
}

output "world_disk_name" {
  value = google_compute_disk.world_disk.name
}

output "world_disk_id" {
  value = google_compute_disk.world_disk.id
}


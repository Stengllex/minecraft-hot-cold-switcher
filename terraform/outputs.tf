output "hot_ip" {
  value = module.minecraft_hot.public_ip
}

output "cold_ip" {
  value = module.minecraft_cold.public_ip
}

output "world_disk" {
  value = google_compute_disk.minecraft_world.name
}


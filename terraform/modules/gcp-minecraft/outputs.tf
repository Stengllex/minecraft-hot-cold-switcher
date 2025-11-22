output "public_ip" {
  value = google_compute_address.mc_ip.address
}

output "instance_name" {
  value = google_compute_instance.mc_vm.name
}


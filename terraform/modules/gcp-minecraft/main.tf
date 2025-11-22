resource "google_compute_address" "mc_ip" {
  name = "${var.server_name}-ip"
}

resource "google_compute_instance" "mc_vm" {
  name         = var.server_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
      type  = "hyperdisk-balanced"
    }
  }

  network_interface {
    network = var.network_name
    access_config {}
  }

  metadata = {
    startup-script = templatefile("${path.module}/startup-script.tpl", {
      server_name = var.server_name
    })
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_instance" "vm" {

  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = var.subnetwork

    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

}

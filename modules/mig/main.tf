resource "google_compute_instance_template" "template" {

  name_prefix  = var.template_name
  machine_type = var.machine_type

tags = [var.instance_tag]
  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    subnetwork = var.subnetwork

    access_config {}
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "mig" {

  name   = var.mig_name
  region = var.region

  version {
    instance_template = google_compute_instance_template.template.id
  }

  base_instance_name = "cloudscaleops"

  target_size = var.target_size

  named_port {
    name = "http"
    port = 80
  }
}

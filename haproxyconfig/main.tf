terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_instance" "app_server" {
  count        = var.instance_count
  name         = "haproxy-backend-${count.index}"
  machine_type = var.instance_type
  zone         = var.zone
  tags         = ["haproxy-backend", "web"]

  boot_disk {
    initialize_params {
      image = var.vm_image
      size  = 20 # GB disk size, adjust if needed
    }
  }

  network_interface {
    # Use the default network or specify a custom one if needed
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  # Add SSH public key for Ansible access
  # Assumes the public key is passed as a string variable
  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }

  # Ensure network is accessible for package installation
  allow_stopping_for_update = true
}

# Note: Ansible provisioning will be handled by the GitHub Actions workflow
# or a separate provisioner in Terraform if more complex initial setup is needed.
# For this setup, we rely on the SSH key and the OS image having SSH server and Python.

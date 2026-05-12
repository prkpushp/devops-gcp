module "monitoring_vm" {
  source = "../../modules/compute"

  instance_name  = var.instance_name
  machine_type   = var.machine_type
  zone           = var.zone
  subnetwork     = var.subnetwork
  instance_tag   = "monitoring"

  ssh_public_key = var.ssh_public_key
}

module "monitoring_firewall" {
  source = "../../modules/firewall"

  name          = "monitoring-firewall"
  network       = var.network

  ports         = ["22", "80", "9090", "9093", "9115", "5000"]

  source_ranges = ["0.0.0.0/0"]

  target_tags   = ["monitoring"]
}

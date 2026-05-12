module "monitoring_vm" {
  source = "../../modules/compute"

  instance_name  = "monitoring-vm"
  machine_type   = var.monitoring_machine_type
  zone           = var.zone
  subnetwork     = var.subnetwork

  instance_tag   = var.monitoring_instance_tag

  ssh_public_key = var.ssh_public_key
}


module "monitoring_firewall" {
  source = "../../modules/firewall"

  name          = var.monitoring_firewall_name
  network       = var.network

  ports         = var.monitoring_firewall_ports
  source_ranges = var.monitoring_source_ranges

  target_tags   = [var.monitoring_instance_tag]
}

module "monitoring_vm" {
  source = "../../modules/compute"

  instance_name  = "monitoring-vm"
  machine_type   = var.machine_type
  zone           = var.zone
  subnetwork     = var.subnet_name

  instance_tag   = var.instance_tag

  ssh_public_key = var.ssh_public_key
}


module "monitoring_firewall" {
  source = "../../modules/firewall"

  name          = var.firewall_name 
  network       = var.network_name

  ports         = var.firewall_ports
  source_ranges = var.firewall_source_ranges 
  target_tags = var.firewall_target_tags
}

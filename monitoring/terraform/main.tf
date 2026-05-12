module "monitoring_vm" {
  source = "../../modules/compute"

  instance_name  = var.instance_name
  machine_type   = var.machine_type
  zone           = var.zone
  subnetwork     = var.subnetwork
  instance_tag   = "monitoring"

  ssh_public_key = var.ssh_public_key
}

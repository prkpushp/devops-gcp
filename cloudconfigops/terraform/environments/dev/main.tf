module "network" {
  source = "../../../../modules/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
  region = var.region
}

module "firewall" {
  source = "../../../../modules/firewall"
  network = module.network.network_name
}

module "web_vm" {
  source = "../../../../modules/compute"
  instance_name = var.instance_name
  machine_type = var.machine_type
  zone = var.zone
  subnetwork = module.network.subnet_name
  ssh_public_key = var.ssh_public_key
}

module "apis" {
  source = "../../../../modules/apis"
  project_id = var.project_id
  apis = var.gcp_apis
}

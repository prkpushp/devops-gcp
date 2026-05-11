module "apis" {
  source     = "../../../../modules/apis"
  project_id = var.project_id
  apis       = var.gcp_apis
}

module "network" {
  source       = "../../../../modules/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
  region       = var.region
}

module "firewall" {
  source = "../../../../modules/firewall"
  network = module.network.network_name
  name = var.firewall_name
  ports = var.firewall_ports
  source_ranges = var.firewall_source_ranges
  target_tags = [var.instance_tag]
}

module "web_mig" {
  source = "../../../../modules/mig"

  template_name   = var.web_template_name
  machine_type    = var.machine_type
  subnetwork      = module.network.subnet_name
  ssh_public_key  = var.ssh_public_key
  mig_name        = var.web_mig_name
  region          = var.region
  target_size     = var.web_target_size
  instance_tag    = var.web_instance_tag
  package_name    = var.package_name
  welcome_message = "WEB SERVER"
}

module "api_mig" {
  source = "../../../../modules/mig"

  template_name   = var.api_template_name
  machine_type    = var.machine_type
  subnetwork      = module.network.subnet_name
  ssh_public_key  = var.ssh_public_key
  mig_name        = var.api_mig_name
  region          = var.region
  target_size     = var.api_target_size
  instance_tag    = var.api_instance_tag
  package_name    = var.package_name
  welcome_message = "API SERVER"
}

module "loadbalancer" {
  source         = "../../../../modules/loadbalancer"
  name           = "cloudscaleops"
  web_instance_group = module.web_mig.instance_group
  api_instance_group = module.api_mig.instance_group
  fqdn = local.fqdn 
  path_rules = var.path_rules
}

module "autoscaler" {
  source = "../../../../modules/autoscaler"
  name   = "cloudscaleops-autoscaler"
  region = var.region
  target = module.web_mig.instance_group_manager
}

module "dns" {
  source     = "../../../../modules/dns"

  domain     = var.domain_name
  zone_name  = "wealthbridgezone-zone"
  lb_ip      = module.loadbalancer.lb_ip
}

locals {
  fqdn = "${var.subdomain}.${var.domain_name}"
}

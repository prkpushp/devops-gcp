variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "machine_type" {
  type = string
}


variable "web_template_name" {}
variable "api_template_name" {}

variable "web_mig_name" {}
variable "api_mig_name" {}

variable "web_target_size" {}
variable "api_target_size" {}

variable "web_instance_tag" {}
variable "api_instance_tag" {}


variable "ssh_public_key" {
  type = string
}

variable "gcp_apis" {
  type = list(string)
}

variable "domain_name" {
  type = string
}

variable "subdomain" {
  type = string
}


variable "firewall_name" {
  type = string
}

variable "firewall_ports" {
  type = list(string)
}

variable "firewall_source_ranges" {
  type = list(string)
}

variable "firewall_target_tags" {
  type = list(string)
}

variable "package_name" {
  type = string
}

variable "instance_tag" {
  type = string
}

variable "path_rules" {

  type = list(object({
    paths   = list(string)
    service = string
  }))
}

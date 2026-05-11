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

variable "template_name" {
  type = string
}

variable "mig_name" {
  type = string
}

variable "target_size" {
  type = number
}

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

variable "instance_tag" {
  type = string
}

variable "package_name" {
  type = string
}

variable "welcome_message" {
  type = string
}

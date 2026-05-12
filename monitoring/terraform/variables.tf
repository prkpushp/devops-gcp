variable "instance_name" {}
variable "machine_type" { default = "e2-micro" }
variable "zone" {}
variable "ssh_public_key" {}
variable "instance_tag" {}

variable "firewall_name" {}
variable "firewall_ports" {}
variable "firewall_source_ranges" {}
variable "firewall_target_tags" {
  description = "Target tags for firewall rules"
  type        = list(string)
}
variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

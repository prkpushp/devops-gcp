variable "instance_name" {}
variable "machine_type" { default = "e2-micro" }
variable "zone" {}
variable "subnetwork" {}
variable "ssh_public_key" {}
variable "instance_tag" {}

variable "firewall_name" {}
variable "firewall_ports" {}
variable "firewall_source_ranges" {}
variable "network" {
  description = "GCP VPC network name"
  type        = string
}

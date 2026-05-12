variable "instance_name" {}
variable "machine_type" { default = "e2-micro" }
variable "zone" {}
variable "subnetwork" {}
variable "ssh_public_key" {}
variable "monitoring_machine_type" {}
variable "monitoring_instance_tag" {}

variable "monitoring_firewall_name" {}
variable "monitoring_firewall_ports" {}
variable "monitoring_source_ranges" {}
variable "network" {
  description = "GCP VPC network name"
  type        = string
}

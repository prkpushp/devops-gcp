variable "project_id" {}

variable "region" {}

variable "zone" {}

variable "ssh_public_key" {}

variable "network_name" {}

variable "subnet_name" {}

variable "subnet_cidr" {}

variable "instance_name" {}

variable "machine_type" {}

variable "gcp_apis" {
  type = list(string)
}

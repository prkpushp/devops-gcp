variable "template_name" {}
variable "machine_type" {}
variable "subnetwork" {}
variable "ssh_public_key" {}
variable "mig_name" {}
variable "region" {}
variable "target_size" {}
variable "instance_tag" {
  type = string
}
variable "package_name" {
  type = string
}

variable "welcome_message" {
  type = string
}

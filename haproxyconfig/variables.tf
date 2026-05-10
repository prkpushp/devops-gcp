variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the resources."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone for the resources."
  type        = string
  default     = "us-central1-a"
}

variable "instance_count" {
  description = "Number of VMs to create."
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "The machine type for the VM instances."
  type        = string
  default     = "e2-micro" # Minimal instance type to avoid cost
}

variable "vm_image" {
  description = "The OS image to use for the VMs."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "ssh_user" {
  description = "The username for SSH access to the instances."
  type        = string
  default     = "user" # Placeholder, will be configured in the workflow
}

variable "ssh_public_key" {
  description = "The SSH public key to use for accessing the instances."
  type        = string
  # This should be provided from a secret in the workflow
}

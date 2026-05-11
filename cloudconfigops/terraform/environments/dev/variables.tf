# =====================================================
# GCP
# =====================================================

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

# =====================================================
# Network
# =====================================================

variable "network_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

# =====================================================
# VM Configuration
# =====================================================

variable "machine_type" {
  type = string
}

variable "haproxy_vm_name" {
  type = string
}

variable "app_vm_1_name" {
  type = string
}

variable "app_vm_2_name" {
  type = string
}

# =====================================================
# SSH
# =====================================================

variable "ssh_public_key" {
  type = string
}

# =====================================================
# APIs
# =====================================================

variable "gcp_apis" {
  type = list(string)
}

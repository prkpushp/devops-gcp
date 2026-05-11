# =====================================================
# GCP Network
network_name = "cloudconfigops-vpc"
subnet_name = "cloudconfigops-subnet"
subnet_cidr = "10.10.0.0/24"

# VM Configuration
machine_type = "e2-micro"
haproxy_vm_name = "haproxy-vm"
app_vm_1_name = "app-vm-1"
app_vm_2_name = "app-vm-2"

# Required APIs

gcp_apis = [
  "compute.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

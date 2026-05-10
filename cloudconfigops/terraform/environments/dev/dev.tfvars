network_name  = "cloudconfigops-vpc"
subnet_name   = "cloudconfigops-subnet"
subnet_cidr   = "10.10.0.0/24"
instance_name = "cloudconfigops-web"
machine_type  = "e2-micro"

gcp_apis = [
  "compute.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

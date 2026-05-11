network_name = "cloudscaleops-vpc"
subnet_name = "cloudscaleops-subnet"
subnet_cidr = "10.20.0.0/24"
machine_type = "e2-micro"
template_name = "cloudscaleops-template"
mig_name = "cloudscaleops-mig"
target_size = 2
domain_name = "wealthbridgezone.com"
subdomain = "cloud"

gcp_apis = [
  "compute.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

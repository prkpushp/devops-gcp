network_name = "cloudscaleops-vpc"
subnet_name = "cloudscaleops-subnet"
subnet_cidr = "10.20.0.0/24"
machine_type = "e2-micro"
template_name = "cloudscaleops-template"
mig_name = "cloudscaleops-mig"
target_size = 2
domain_name = "wealthbridgezone.com"
subdomain = "cloud"
network_name = "dev-network"
firewall_name = "dev-allow-ssh-http"
firewall_ports = ["22", "80", "443"]
firewall_source_ranges = ["0.0.0.0/0"]
firewall_target_tags = ["web-dev"]

gcp_apis = [
  "compute.googleapis.com",
  "dns.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

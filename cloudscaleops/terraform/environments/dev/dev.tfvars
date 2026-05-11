network_name = "cloudscaleops-vpc"
subnet_name = "cloudscaleops-subnet"
subnet_cidr = "10.20.0.0/24"
machine_type = "e2-micro"
domain_name = "wealthbridgezone.com"
subdomain = "cloud"
firewall_name = "dev-allow-ssh-http"
firewall_ports = ["22", "80", "443"]
firewall_source_ranges = ["0.0.0.0/0"]
firewall_target_tags = ["web-ssh-cloudscaleops-dev"]
instance_tag = "web-ssh-cloudscaleops-dev"
package_name = "nginx"
web_template_name = "cloudscaleops-web-template"
api_template_name = "cloudscaleops-api-template"

web_mig_name = "cloudscaleops-web"
api_mig_name = "cloudscaleops-api"

web_target_size = 2
api_target_size = 2

web_instance_tag = "web-ssh-cloudscaleops-dev"
api_instance_tag = "web-ssh-cloudscaleops-dev"

path_rules = [
  {
    paths   = ["/api", "/api/*"]
    service = "api"
  }
]

gcp_apis = [
  "compute.googleapis.com",
  "dns.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

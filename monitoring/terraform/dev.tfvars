# ==================================================
# GCP NETWORK CONFIG
# ==================================================

subnet_name  = "cloudscaleops-subnet"
subnet_cidr  = "10.20.0.0/24"

# ==================================================
# MONITORING VM CONFIG
# ==================================================

machine_type = "e2-micro"

instance_tag = "monitoring"

instance_name = "monitoring-vm"

# ==================================================
# FIREWALL CONFIG (MONITORING STACK)
# ==================================================

firewall_name = "dev-monitoring-firewall"

firewall_ports = [
  "22",     # SSH
  "80",     # HTTP (optional nginx / health check)
  "443",    # HTTPS (future-proof)
  "9090",   # Prometheus
  "9093",   # Alertmanager
  "9115",   # Blackbox exporter
  "5000"    # Flask webhook
]

firewall_source_ranges = ["0.0.0.0/0"]

firewall_target_tags = ["monitoring"]

# ==================================================
# SSH CONFIG
# ==================================================

ssh_username = "ubuntu"

# SSH public key injected into VM
# (passed from GitHub Secrets in CI)
ssh_public_key = ""

# ==================================================
# DOMAIN CONFIG (optional future use)
# ==================================================

domain_name = "wealthbridgezone.com"
subdomain   = "cloud"

# ==================================================
# GCP API ENABLEMENT
# ==================================================

gcp_apis = [
  "compute.googleapis.com",
  "dns.googleapis.com",
  "iam.googleapis.com",
  "storage.googleapis.com",
  "cloudresourcemanager.googleapis.com"
]

output "lb_ip" {
  value = google_compute_global_forwarding_rule.forwarding_rule.ip_address
}

output "application_url" {
  value = "https://${local.fqdn}"
}

locals {
  fqdn = var.fqdn
}

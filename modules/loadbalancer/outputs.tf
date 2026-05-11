output "lb_ip" {
  value = google_compute_global_address.lb_ip.address
}

output "application_url" {
  value = "https://${var.fqdn}"
}

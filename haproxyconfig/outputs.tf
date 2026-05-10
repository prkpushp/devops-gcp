output "instance_public_ips" {
  description = "Public IP addresses of the compute instances."
  value       = google_compute_instance.app_server[*].network_interface[0].access_config[0].nat_ip
}

output "instance_names" {
  description = "Names of the compute instances."
  value       = google_compute_instance.app_server[*].name
}

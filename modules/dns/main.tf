resource "google_dns_managed_zone" "main" {
  name     = var.zone_name
  dns_name = "${var.domain}."

  description = "DNS zone for ${var.domain}"
}

resource "google_dns_record_set" "cloud" {
  name         = "cloud.${var.domain}."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.main.name

  rrdatas = [
    var.lb_ip
  ]
}

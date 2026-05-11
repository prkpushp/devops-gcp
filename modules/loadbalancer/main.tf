resource "google_compute_global_address" "lb_ip" {
  name = "${var.name}-ip"
}

# -----------------------------
# Health Check
# -----------------------------
resource "google_compute_health_check" "http_health_check" {
  name = "${var.name}-hc"

  http_health_check {
    port = 80
  }
}

# -----------------------------
# Backend Service (MIG)
# -----------------------------
resource "google_compute_backend_service" "backend" {
  name        = "${var.name}-backend"
  protocol    = "HTTP"
  timeout_sec = 10

  health_checks = [
    google_compute_health_check.http_health_check.id
  ]

  backend {
    group = var.instance_group
  }
}

# -----------------------------
# HTTP → HTTPS Redirect Map
# -----------------------------
resource "google_compute_url_map" "http_redirect" {
  name = "${var.name}-http-redirect"

  default_url_redirect {
    https_redirect = true
    strip_query    = false
  }
}

# -----------------------------
# HTTPS URL Map (real traffic)
# -----------------------------
resource "google_compute_url_map" "url_map" {
  name            = "${var.name}-url-map"
  default_service = google_compute_backend_service.backend.id
}

# -----------------------------
# HTTP Proxy
# -----------------------------
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "${var.name}-http-proxy"
  url_map = google_compute_url_map.http_redirect.id
}

# -----------------------------
# HTTPS Proxy
# -----------------------------
resource "google_compute_target_https_proxy" "https_proxy" {
  name    = "${var.name}-https-proxy"
  url_map = google_compute_url_map.url_map.id

  ssl_certificates = [
    google_compute_managed_ssl_certificate.ssl_cert.id
  ]
}

# -----------------------------
# SSL Certificate (Managed)
# -----------------------------
resource "google_compute_managed_ssl_certificate" "ssl_cert" {
  name = "${var.name}-ssl"

  managed {
    domains = [var.fqdn]
  }
}

# -----------------------------
# HTTP Forwarding Rule
# -----------------------------
resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "${var.name}-http-rule"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"

  ip_address = google_compute_global_address.lb_ip.address
}

# -----------------------------
# HTTPS Forwarding Rule
# -----------------------------
resource "google_compute_global_forwarding_rule" "https_forwarding_rule" {
  name       = "${var.name}-https-rule"
  target     = google_compute_target_https_proxy.https_proxy.id
  port_range = "443"

  ip_address = google_compute_global_address.lb_ip.address
}

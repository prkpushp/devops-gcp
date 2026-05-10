provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  apis = [
    "compute.googleapis.com",
    "sqladmin.googleapis.com",
    "iam.googleapis.com"
  ]
}

resource "google_project_service" "apis" {
  for_each = toset(local.apis)
  service  = each.value

  disable_on_destroy = false
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_compute_network" "vpc" {
  name = "devops-vpc"
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc.id
  region        = var.region
  private_ip_google_access = true

}

resource "google_compute_router" "router" {
  name    = "nat-router"
  network = google_compute_network.vpc.id
  region  = var.region

  bgp {
    asn = 64514
  }
}

resource "google_compute_address" "nat_ip" {
  name   = "nat-static-ip"
  region = var.region
}

resource "google_compute_router_nat" "nat" {
  name                               = "nat-config"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = [google_compute_address.nat_ip.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "allow-egress" {
  name    = "allow-egress"
  network = google_compute_network.vpc.name

  direction = "EGRESS"

  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "app" {
  depends_on = [google_project_service.apis]
  count        = 2
  name         = "app-vm-${count.index}"
  machine_type = "e2-micro"
  zone         = "${var.region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }
}

resource "google_sql_database_instance" "db" {
  depends_on = [google_project_service.apis]

  name             = "devops-db"
  database_version = "MYSQL_8_0"
  region           = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}

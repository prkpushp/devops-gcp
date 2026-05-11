resource "google_compute_region_autoscaler" "autoscaler" {

  name   = var.name
  region = var.region
  target = var.target

  autoscaling_policy {

    max_replicas = 4
    min_replicas = 2

    cpu_utilization {
      target = 0.6
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "YOUR_GCS_BUCKET_NAME"
    prefix = "cloudconfigops/dev"
  }
}

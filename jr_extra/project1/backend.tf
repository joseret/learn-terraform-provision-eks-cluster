terraform {
  backend "gcs" {
    bucket = "hybrid-tf"
    prefix = "tf/hybrid/project1"
  }
}

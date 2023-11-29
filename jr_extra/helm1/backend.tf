terraform {
  backend "gcs" {
    bucket = "hybrid-tf"
    prefix = "tf/hybrid/aws/helm-addon1"
  }
}

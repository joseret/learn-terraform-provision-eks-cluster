terraform {
  backend "gcs" {
    bucket = "hybrid-tf"
    prefix = "tf/hybrid/aws/cl1"
  }
}

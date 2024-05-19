terraform {
  backend "gcs" {
    bucket = "jr-network-infra-1-4978-info1"
    prefix = "tf/irsa/aws/cl2"
  }
}

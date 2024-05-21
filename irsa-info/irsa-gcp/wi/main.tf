
module "project_services_networking" {
  source                      = "terraform-google-modules/project-factory/google//modules/project_services"
  version                     = "~> 14.4"
  project_id                  = var.project_id
  disable_dependent_services  = false
  disable_services_on_destroy = false

  activate_apis = ["sts.googleapis.com"]

}

resource "google_iam_workload_identity_pool" "aws_irsa_1" {
  provider                  = google-beta
  project                   = var.project_id
  workload_identity_pool_id = "aws-brcm-irsa-pool-v1"
}

resource "google_iam_workload_identity_pool_provider" "aws_irsa_1a" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.aws_irsa_1.workload_identity_pool_id
  workload_identity_pool_provider_id = "aws-brcm-irsa-pool-v1-ap1"
  display_name                       = "aws-brcm-irsa-pool-v1-ap1"
  description                        = "aws-brcm-irsa-pool-v1-ap1"
  disabled                           = false
  # attribute_condition                = "attribute.aws_role==\"arn:aws:sts::999999999999:assumed-role/stack-eu-central-1-lambdaRole\""
  attribute_mapping = {
    "google.subject"        = "assertion.arn"
    "attribute.aws_account" = "assertion.account"
    "attribute.aws_role"    = "assertion.arn.extract('assumed-role/{role}/')"
    # attribute.pod=assertion['kubernetes.io']['pod']['name']
  }
  aws {
    account_id = "660387449292"
  }
}

# principalSet://iam.googleapis.com/projects/496684231732/locations/global/workloadIdentityPools/aws-brcm-irsa-pool-v1/attribute.aws_role/jr-app-a-ksa
resource "google_iam_workload_identity_pool_provider" "aws_irsa_5" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.aws_irsa_1.workload_identity_pool_id
  workload_identity_pool_provider_id = "aws-brcm-irsa-pool-v1-p4"
  display_name                       = "aws-brcm-irsa-pool-v1-p4"
  description                        = "aws-brcm-irsa-pool-v1-p4"
  disabled                           = false
  # attribute_condition                = "attribute.aws_role==\"arn:aws:sts::999999999999:assumed-role/stack-eu-central-1-lambdaRole\""
  attribute_mapping = {
    "google.subject"                 = "assertion.sub"
    "attribute.account"              = "assertion.account"
    "attribute.namespace"            = "assertion['kubernetes.io']['namespace']"
    "attribute.service_account_name" = "assertion['kubernetes.io']['serviceaccount']['name']",
    # attribute.pod=assertion['kubernetes.io']['pod']['name']
  }
  oidc {
    # allowed_audiences = ["https//sts.amazonaws.com "]
    issuer_uri = "https://oidc.eks.us-east-2.amazonaws.com/id/C4A66BA560C59E63E3933A5E75EEF5C3"

  }
}

module "project_deployer_gsa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 4.2"
  project_id    = var.project_id
  names         = ["aws-brcm-irsa-pool-v1-sa1"]
  description   = "aws-brcm-irsa-pool-v1-sa1"
  project_roles = [format("%s=>%s", var.project_id, "roles/storage.objectViewer")]
}


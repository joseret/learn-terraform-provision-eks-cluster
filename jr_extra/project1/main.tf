/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  iam_uj1_gke = "jr-uj1-gke"
}

module "project_services_gke" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.4"

  project_id                  = var.project_id
  disable_dependent_services  = false
  disable_services_on_destroy = false

  activate_apis = [
    "secretmanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dns.googleapis.com",
    "iamcredentials.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudapis.googleapis.com",
    "servicemanagement.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com",
    # "anthos.googleapis.com",
    # "anthosaudit.googleapis.com",
    # "anthosgke.googleapis.com",
    # "bigquery.googleapis.com",
    # "cloudbuild.googleapis.com",
    # "cloudresourcemanager.googleapis.com",
    # "compute.googleapis.com",
    # "container.googleapis.com",       // GKE https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity
    # "gkeconnect.googleapis.com",
    # "gkehub.googleapis.com",
    # "logging.googleapis.com",
    # "iamcredentials.googleapis.com",  // Workload Identity https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity
    # "monitoring.googleapis.com",
    # "pubsub.googleapis.com",
    # "stackdriver.googleapis.com",
    # "storage-api.googleapis.com",
    # "storage-component.googleapis.com",
  ]
}

# module "gke_default_node_gsa" {
#   source     = "terraform-google-modules/service-accounts/google"
#   version    = "= 4.1.1"
#   project_id = var.project_id
#   prefix     = "sa"
#   names      = ["node-def-gsa-${local.iam_uj1_bootstrap_short_name}"]
#   project_roles = [
#     "${var.project_id}=>roles/container.nodeServiceAccount"
#   ]
# }

# resource "google_storage_bucket_iam_member" "tf_backend_bucket_main_gke" {
#   bucket     = var.tf_backend_bucket
#   role       = "roles/storage.objectAdmin"
#   member     = "serviceAccount:${module.uj1_tf_gke_build_gsa.email}"
#   depends_on = [module.uj1_tf_gke_build_gsa]
# }

module "deployer_aws_gsa" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "~> 4.2"
  project_id = var.project_id
  prefix     = "gsa"
  names      = ["deployer-aws"]
  project_roles = [
    "${var.project_id}=>roles/secretmanager.secretAccessor",
    "${var.project_id}=>roles/editor",
  ]
}


module "deployer_ose_gsa" {
  source     = "terraform-google-modules/service-accounts/google"
  version    = "~> 4.2"
  project_id = var.project_id
  prefix     = "gsa"
  names      = ["deployer-ose"]
  project_roles = [
    "${var.project_id}=>roles/compute.admin",
    "${var.project_id}=>roles/iam.securityAdmin",
    "${var.project_id}=>roles/iam.serviceAccountAdmin",
    "${var.project_id}=>roles/iam.serviceAccountKeyAdmin",
    "${var.project_id}=>roles/iam.serviceAccountUser",
    "${var.project_id}=>roles/storage.admin",
    "${var.project_id}=>roles/dns.admin",
    "${var.project_id}=>roles/compute.loadBalancerAdmin",
    "${var.project_id}=>roles/iam.roleViewer",
  ]
}

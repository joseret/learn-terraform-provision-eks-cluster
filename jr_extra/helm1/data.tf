data "google_secret_manager_secret_version" "gh_pat" {
  project = var.gcp_project_id
  secret  = "hc1-b"
}

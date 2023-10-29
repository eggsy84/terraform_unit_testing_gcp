variables {
  company_name  = "acme"
  region        = "europe-west2"
  project_id    = "example"
}

run "valid_dev_naming_convention" {

  command = plan

  assert {
    condition     = google_compute_subnetwork.dev.name == "acme-app-eu-we2-dev-subnet"
    error_message = "Dev subnet name did not match expected naming convention"
  }

  assert {
    condition     = google_compute_subnetwork.prod.name == "acme-app-eu-we2-prod-subnet"
    error_message = "Prod subnet name did not match expected naming convention"
  }
}
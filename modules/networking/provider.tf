terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.3.0"
    }
  }

  # Need Terraform 1.6 minimum for testing
  required_version = ">= 1.6.0"
}

provider "google" {
  region = "europe-west2"
  project = var.project_id
}
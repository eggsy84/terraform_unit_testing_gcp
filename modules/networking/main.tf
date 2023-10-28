# Example networking module creates a dev and production subnet
# with a specified region. 
# Naming style for networks loosely based on Google Best Practices
# https://cloud.google.com/architecture/best-practices-vpc-design#naming

resource "google_compute_network" "vpc_network" {
  name = "${var.company_name}-app"
  description = "VPC network for the ${var.company_name} app"
}

# Example name for europe-west2 and company name Acme company app
# acme-app-eu-we2-prod-subnet
# acme-app-eu-we2-dev-subnet
resource "google_compute_subnetwork" "dev" {
  name          = "${var.company_name}-app-${substr(var.region, 0, 2)}-${substr(trimprefix(var.region, "-"), 0, 2)}-dev-subnet"
  ip_cidr_range = "10.128.0.0/20"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "prod" {
  name          = "${var.company_name}-app-${substr(var.region, 0, 2)}-${substr(trimprefix(var.region, "-"), 0, 2)}-prod-subnet"
  ip_cidr_range = "10.154.0.0/20"
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
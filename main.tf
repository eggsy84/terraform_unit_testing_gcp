module "networking" {
    source = "./modules/networking"

    company_name    = "acme"
    region          = "europe-west2"
    project_id      = "example"
}
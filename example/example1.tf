module "label1" {
  source = "../"
  environment = "dev"
  project_name = "obytes"
  region = "me-south-1"
  delimiter = "_"
  attributes  = ["private"]
  enabled = true
}


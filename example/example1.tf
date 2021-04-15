module "label1" {
  source = "../"
  environment = "dev"
  project_name = "obytes"
  region = "me-south-1"
  delimiter = "+"
  attributes  = ["private"]
  enabled = true
  prefix_length_limit = 10
}


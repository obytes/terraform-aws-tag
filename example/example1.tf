module "label1" {
  source = "../"
  environment = "dev"
  project_name = "pto"
  company_name = "keepers"
  region = "eu-west-1"
  prefix_order = ["company_name", "environment", "project_name", "region"]
  delimiter = "-"
  attributes  = ["private"]
  enabled = true
  prefix_length_limit = 12
}


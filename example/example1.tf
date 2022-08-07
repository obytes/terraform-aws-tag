module "label1" {
  source = "../"
  environment = "stg"
  project_name = "pto"
  region = "me-south-1"
  delimiter = "-"
  attributes  = ["private"]
  enabled = true
  prefix_length_limit = 12
  name ="vpc"
}


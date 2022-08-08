module "label3" {
  source = "../"
  context = module.label1.context
  environment = "prd"
  region = "us-east-1"
  delimiter = "-"
  prefix_length_limit = 12
}
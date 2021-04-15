module "label3" {
  source = "../"
  context = module.label1.context
  name = "prv"
  environment = "prd"
  region = "us-east-1"
  delimiter = "-"
  random_string = module.label1.random_string
}
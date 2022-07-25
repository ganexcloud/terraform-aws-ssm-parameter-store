provider "aws" {
  region = "us-east-1"
}

# Simple
module "ssm_parameter_store_simple" {
  source = "../../"
  name   = "/test/parameter"
  value  = "XXXXXXXXXXXXXx"
  type   = "SecureString"
}

# Random
module "ssm_parameter_store_random" {
  source = "../../"
  name   = "/test/parameter"
  value  = "" # If value is empty module will create a random string
  type   = "SecureString"
}

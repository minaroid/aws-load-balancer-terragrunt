terraform {
  source = "../../../modules/aws-internet-gateway"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "aws-vpc" {
  config_path = "../aws-vpc"
}

inputs = {
  environment  = "production"
  vpc_id       = dependency.aws-vpc.outputs.vpc_id
}



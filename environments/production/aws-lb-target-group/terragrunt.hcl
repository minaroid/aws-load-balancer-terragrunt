terraform {
  source = "../../../modules/aws-lb-target-group"
}

include "root" {
  path = find_in_parent_folders()
}  

dependency "aws-vpc" {
  config_path = "../aws-vpc"
}

inputs = {
  vpc_id        = dependency.aws-vpc.outputs.vpc_id
}



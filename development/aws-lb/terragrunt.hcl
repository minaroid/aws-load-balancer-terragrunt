terraform {
  source = "../../modules/aws-lb"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

dependency "aws-security-group" {
  config_path = "../aws-security-group"
}

inputs = {
  environment         = "development"
  region              = "us-east-1"
  alb_security_groups  = dependency.aws-security-group.outputs.alb_security_groups
  public_subnets_ids = dependency.aws-subnet.outputs.public_subnets_ids
}
 



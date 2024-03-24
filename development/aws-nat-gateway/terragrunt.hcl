terraform {
  source = "../../modules/aws-nat-gateway"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

inputs = {
  environment                 = "development"
  region                      = "us-east-1"
  public_subnets_ids          = dependency.aws-subnet.outputs.public_subnets_ids
}
 



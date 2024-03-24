terraform {
  source = "../../../modules/aws-subnet"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "aws-vpc" {
  config_path = "../aws-vpc"
}

inputs = {
  environment                 = "production"
  region                      = "us-east-1"
  availability_zones          = ["us-east-1a", "us-east-1b"]
  public_subnets_cidr_blocks  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnets_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  vpc_id                      = dependency.aws-vpc.outputs.vpc_id
}



terraform {
  source = "../../../modules/aws-route-table"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "aws-vpc" {
  config_path = "../aws-vpc"
}

dependency "aws-internet-gateway" {
  config_path = "../aws-internet-gateway"
}

dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

dependency "aws-nat-gateway" {
  config_path = "../aws-nat-gateway"
}

inputs = {
  environment         = "development"
  region              = "us-east-1"
  vpc_id              = dependency.aws-vpc.outputs.vpc_id
  igw_id              = dependency.aws-internet-gateway.outputs.igw_id
  public_subnets_ids  = dependency.aws-subnet.outputs.public_subnets_ids
  private_subnets_ids = dependency.aws-subnet.outputs.private_subnets_ids
  private_subnets_ids = dependency.aws-subnet.outputs.private_subnets_ids
  nat_gateways_ids    = dependency.aws-nat-gateway.outputs.nat_ids
}
 



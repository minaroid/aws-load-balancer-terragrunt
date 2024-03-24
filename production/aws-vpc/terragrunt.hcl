terraform {
  source = "../../modules/aws-vpc"
}

include "root" {
  path = find_in_parent_folders()
}  

inputs = {
  environment   = "production"
  region        = "us-east-1"
  cidr_block    = "10.0.0.0/16"
}



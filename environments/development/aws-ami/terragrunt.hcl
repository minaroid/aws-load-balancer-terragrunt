terraform {
  source = "../../../modules/aws-ami"
}

include "root" {
  path = find_in_parent_folders()
}  

inputs = {
  environment                = "development"
  region                     = "us-east-1"
}



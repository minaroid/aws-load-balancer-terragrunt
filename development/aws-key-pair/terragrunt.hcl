terraform {
  source = "../../modules/aws-key-pair"
}

include "root" {
  path = find_in_parent_folders()
}  

inputs = {
  environment                = "development"
  region                     = "us-east-1"
  ssh_public_key_location    = "~/.ssh/id_rsa.pub"
}



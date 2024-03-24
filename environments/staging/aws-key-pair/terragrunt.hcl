terraform {
  source = "../../../modules/aws-key-pair"
}

include "root" {
  path = find_in_parent_folders()
}  

inputs = {
  ssh_public_key_location    = "~/.ssh/id_rsa.pub"
}



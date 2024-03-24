terraform {
  source = "../../modules/aws-launch-configuration"
}

include "root" {
  path = find_in_parent_folders()
}  

dependency "aws-ami" {
  config_path = "../aws-ami"
}

dependency "aws-key-pair" {
  config_path = "../aws-key-pair"
}

dependency "aws-security-group" {
  config_path = "../aws-security-group"
}

inputs = {
  environment                = "development"
  region                     = "us-east-1"
  ubuntu_ami_id              = dependency.aws-ami.outputs.ubuntu_ami_id
  app_server_security_groups = dependency.aws-security-group.outputs.app_server_security_groups
  key_pair_name              = dependency.aws-key-pair.outputs.app_key_name
}



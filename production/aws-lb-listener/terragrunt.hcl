terraform {
  source = "../../modules/aws-lb-listener"
}

include "root" {
  path = find_in_parent_folders()
}  

dependency "aws-lb" {
  config_path = "../aws-lb"
}

dependency "aws-lb-target-group" {
  config_path = "../aws-lb-target-group"
}


inputs = {
  environment            = "production"
  region                 = "us-east-1"
  app_alb_arn            = dependency.aws-lb.outputs.app_alb_arn
  app_target_group_arn   = dependency.aws-lb-target-group.outputs.app_target_group_arn
}



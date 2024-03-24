terraform {
  source = "../../../modules/aws-autoscaling-group"
}

include "root" {
  path = find_in_parent_folders()
}  


dependency "aws-subnet" {
  config_path = "../aws-subnet"
}

dependency "aws-launch-configuration" {
  config_path = "../aws-launch-configuration"
}

dependency "aws-lb-target-group" {
  config_path = "../aws-lb-target-group"
}

inputs = {
  private_subnets_ids         = dependency.aws-subnet.outputs.private_subnets_ids
  app_launch_configuration_id = dependency.aws-launch-configuration.outputs.app_launch_configuration_id
  app_target_group_arn        = dependency.aws-lb-target-group.outputs.app_target_group_arn
}



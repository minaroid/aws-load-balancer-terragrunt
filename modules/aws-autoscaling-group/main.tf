provider "aws" {
  region = var.region
}
resource "aws_autoscaling_group" "app-asg" {
  name                 = "${var.environment}-app-asg"
  launch_configuration = var.app_launch_configuration_id
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = var.private_subnets_ids

  target_group_arns = [var.app_target_group_arn]

  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "${var.environment}-app-instance"
    propagate_at_launch = true
  }
}
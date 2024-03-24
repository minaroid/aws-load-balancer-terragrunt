provider "aws" {
  region = var.region
}
resource "aws_autoscaling_group" "app-asg" {
  name                 = "${var.environment}-app-asg"
  launch_configuration = var.app_launch_configuration_id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.private_subnets_ids

  target_group_arns = [var.app_target_group_arn]

  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "${var.environment}-app-instance"
    propagate_at_launch = true
  }
}
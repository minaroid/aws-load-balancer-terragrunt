output "jumpbox_security_groups" {
  value = [aws_security_group.jumpbox-sg.id]
}

output "app_server_security_groups" {
  value = [aws_security_group.app-server-sg.id]
}

output "alb_security_groups" {
  value = [aws_security_group.alb-sg.id]
}
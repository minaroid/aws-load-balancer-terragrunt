provider "aws" {
  region = var.region
}
resource "aws_launch_configuration" "app-launch-config" {
  name            = "${var.environment}-app-launch-config"
  image_id        = var.ubuntu_ami_id
  instance_type   = "t2.micro"
  security_groups = var.app_server_security_groups
  key_name        = var.key_pair_name
  user_data       = <<-EOF
                      #!/bin/bash
                      sleep 5
                      sudo apt update -y
                      sudo apt install -y docker.io
                      sudo docker run --name nginx -d -p 80:80 nginx 
                      sudo docker exec -i nginx bash -c "echo \"Hello from $(hostname -f)\" > /usr/share/nginx/html/index.html"
                    EOF
  lifecycle {
    create_before_destroy = true
  }
}
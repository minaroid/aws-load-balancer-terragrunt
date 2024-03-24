provider "aws" {
  region = var.region
}
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.environment}-internet-gateway"
  }
}
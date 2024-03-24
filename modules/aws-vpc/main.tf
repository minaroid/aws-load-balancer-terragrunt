provider "aws" {
  region = var.region
}
resource "aws_vpc" "custom-vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.environment}-vpc"
  }
}

provider "aws" {
  region = var.region
}
resource "aws_eip" "nat-eip-1a" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gateway-1a" {
  allocation_id = aws_eip.nat-eip-1a.id
  subnet_id     = var.public_subnets_ids[0]
}

resource "aws_eip" "nat-eip-1b" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat-gateway-1b" {
  allocation_id = aws_eip.nat-eip-1b.id
  subnet_id     = var.public_subnets_ids[1]
}
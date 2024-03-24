provider "aws" {
  region = var.region
}
resource "aws_subnet" "public-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnets_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${var.environment}-public-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnets_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${var.environment}-public-1b"
  }
}


resource "aws_subnet" "private-1a" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${var.environment}-private-1a"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnets_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${var.environment}-private-1b"
  }
}

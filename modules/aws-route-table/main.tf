provider "aws" {
  region = var.region
}
// private RT - 1A
resource "aws_route_table" "private-route-table-1a" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateways_ids[0]
  }

  tags = {
    Name = "${var.environment}-private-rt-1a"
  }
}

resource "aws_route_table_association" "private-subnets-1a-association" {
  subnet_id      = var.private_subnets_ids[0]
  route_table_id = aws_route_table.private-route-table-1a.id
}

// private RT - 1B
resource "aws_route_table" "private-route-table-1b" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateways_ids[1]
  }

  tags = {
    Name = "${var.environment}-private-rt-1b"
  }
}

resource "aws_route_table_association" "private-subnets-1b-association" {
  subnet_id      = var.private_subnets_ids[1]
  route_table_id = aws_route_table.private-route-table-1b.id
}


// Public RT
resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route_table_association" "public-subnets-association" {
  count          = length(var.public_subnets_ids)
  subnet_id      = var.public_subnets_ids[count.index]
  route_table_id = aws_route_table.public-route-table.id
}

output "private_subnets_ids" {
  value = [aws_subnet.private-1a.id, aws_subnet.private-1b.id]
}

output "public_subnets_ids" {
  value = [aws_subnet.public-1a.id, aws_subnet.public-1b.id]
}

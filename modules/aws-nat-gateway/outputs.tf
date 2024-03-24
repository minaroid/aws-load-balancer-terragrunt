output "nat_ids" {
  value = [aws_nat_gateway.nat-gateway-1a.id, aws_nat_gateway.nat-gateway-1b.id]
}

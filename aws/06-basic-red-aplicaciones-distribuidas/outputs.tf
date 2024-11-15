# IDs y CIDRs de las subredes públicas
output "subnet_public_ids" {
  value       = [for subnet in aws_subnet.subnet_public : subnet.id]
  description = "IDs de las subredes públicas"
}

output "subnet_public_cidrs" {
  value       = [for subnet in aws_subnet.subnet_public : subnet.cidr_block]
  description = "CIDRs de las subredes públicas"
}

# IDs y CIDRs de las subredes privadas
output "subnet_private_ids" {
  value       = [for subnet in aws_subnet.subnet_private : subnet.id]
  description = "IDs de las subredes privadas"
}

output "subnet_private_cidrs" {
  value       = [for subnet in aws_subnet.subnet_private : subnet.cidr_block]
  description = "CIDRs de las subredes privadas"
}

# ID del NAT Gateway
output "nat_gw_id" {
  value       = aws_nat_gateway.nat_gw[0].id
  description = "ID del NAT Gateway"
}


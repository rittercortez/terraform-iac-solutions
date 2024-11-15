output "vpc_id" {
  value = aws_vpc.vpc_principal.id
}
output "subnet_id" {
  value = aws_subnet.subnet_public.id
}


output "subnet_id" {
  value = aws_subnet.subnet_public.id
  description = "ID de subnet pública"
}
output "vpc_id" {
  value       = aws_vpc.VPC-ohio.id
  description = "ID de la VPC creada"
}

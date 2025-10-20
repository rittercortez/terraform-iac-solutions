# Para visualizar datos importantes rapidamente por la consola
output "Subred_ID" {
  value = aws_subnet.subnet_public.id
  description = "ID de subnet pública"
}
output "VPC_ID" {
  value       = aws_vpc.VPC-ohio.id
  description = "ID de la VPC creada"
}
output "IP_Pública" {
  description = "Dirección IP pública"
  value = aws_instance.server-01.public_ip
}

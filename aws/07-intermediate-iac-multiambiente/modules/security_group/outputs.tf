output "sg_rules_ingress" {
  value = aws_security_group.sg.ingress
}
output "sg_id" {
  value = aws_security_group.sg.id
}
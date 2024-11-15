resource "aws_security_group" "sg_public" {
  vpc_id      = aws_vpc.vpc.id
  name = "sg_${local.project_06}"

  # Dynamic recorre la lista de la variable y ejecuta cada puerto para cumplir con DRY
  dynamic "ingress" {
    for_each = var.security_group.ingress_list_port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.security_group.all_ip_access] # Convertir en lista
    }
  }

  # Permite el tráfico SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.security_group.cidr_ssh] # Convertir en lista
  }

  # Regla de egress para permitir todo el tráfico saliente
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.security_group.all_ip_access]
  }
}

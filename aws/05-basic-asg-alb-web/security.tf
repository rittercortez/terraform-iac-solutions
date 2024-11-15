# Grupo de seguridad - para filtrar el tráfico de nuestra red
resource "aws_security_group" "sg_ec2" {
  vpc_id = aws_vpc.vpc_principal.id
  ingress {
    protocol  = 0
    self      = true
    from_port = 80
    to_port   = 80
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = 0
    cidr_blocks = [var.network_vpc.sg_egress_cidr]
  }
  tags = {
    Name = "sg-ec2"
  }
}

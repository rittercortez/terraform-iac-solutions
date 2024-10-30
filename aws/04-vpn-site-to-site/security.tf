resource "aws_security_group" "sg_vpn" {
  vpc_id = aws_vpc.vpc_principal.id

  # Reglas de entrada
  ingress {
    from_port   = 500
    to_port     = 500
    protocol    = "udp"                   # IKE (Internet Key Exchange)
    cidr_blocks = [var.onpremise_cidr[1]] # Solo la red on-premise
  }

  ingress {
    from_port   = 4500
    to_port     = 4500
    protocol    = "udp"                   # IPsec NAT Traversal (NAT-T)
    cidr_blocks = [var.onpremise_cidr[1]] # Solo la red on-premise
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "50"                    # Protocolo ESP 
    cidr_blocks = [var.onpremise_cidr[1]] # Red on-premise
  }

  # Reglas de salida (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"              # Permite todo el tráfico saliente
    cidr_blocks = [var.egress_cidr] # Permitir salida a cualquier destino 
  }

  tags = {
    Name = "Security Group - VPN"
  }
}

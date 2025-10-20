# Instancia 
resource "aws_instance" "server-01" {
  ami           = var.ami_ec2.AL2  # Amazon Linux 2
  instance_type = var.type_ec2[0]
  subnet_id     = aws_subnet.subnet_public.id
  key_name      = data.aws_key_pair.key.key_name  # Corregido
  tags = {
    Name = "Instancia de Desarrollo"
  }
}

# Security Group
resource "aws_security_group" "sg_ec2" {
  vpc_id = aws_vpc.VPC-ohio.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"   # Cambiar el protocolo a TCP
    cidr_blocks = [var.sg_cidr[0]]  # Esto permite SSH desde cualquier IP (solo para pruebas)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Permite todo el tráfico saliente
    cidr_blocks = [var.sg_cidr[0]]
  }
  tags = {
    Name = "EC2 Security Group"
  }
}
# Para que todo esto funcione tenemos que agregar la instancia a un ROL IAM para podernos conectar por ssh 
# Podemos crear nosotros mismos la política de conexión o escoger una política ya creada
# Está fue la pólitica que cree
/* {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2-instance-connect:SendSSHPublicKey",
            "Resource": "arn:aws:ec2:*:*:instance/*"
        }
    ]
} */

# Por último ejecuta este comando:
# aws ec2 authorize-security-group-ingress --group-id sg-xxxxxxxxxxxxxxx --protocol tcp --port 22 --cidr 0.0.0.0/0 --region us-east-2


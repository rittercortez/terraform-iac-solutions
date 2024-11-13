# Instancia para realizar las pruebas de conexiones.
resource "aws_instance" "server_01" {
  subnet_id              = aws_subnet.subnet_public[0].id
  ami                    = var.ec2.ami
  instance_type          = var.ec2.type_intance
  vpc_security_group_ids = [aws_security_group.sg_public.id]
  tags = {
    Name = "Server 01 - ${local.project_06}"
  }
}

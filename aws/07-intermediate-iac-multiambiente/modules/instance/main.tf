resource "aws_instance" "ec2" {
  security_groups = [var.security_group]
  ami             = var.instance_ami
  instance_type   = var.instance_type
  count           = var.instance_amount
  user_data       = file(var.instance_script)
  tags = {
    Name = "${var.instance_name}-${var.environment}"
  }
}

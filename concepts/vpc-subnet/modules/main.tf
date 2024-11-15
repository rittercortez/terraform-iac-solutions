resource "aws_vpc" "vpc_principal" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC - Principal"
  }
}
resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.vpc_principal.id
  cidr_block = var.subnet_cidr
  tags = {
    Name = "Subred - Pública"
  }
}

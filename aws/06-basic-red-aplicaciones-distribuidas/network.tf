# VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc # Recoge los datos CIDR de esta variable
  tags = {
    Name = "VPC-${local.project_06}"
  }
}

# Subred Pública
resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true # Asigna IPs publicas
  cidr_block              = var.subnet_flex.num_subnet_public[count.index]
  count                   = length(var.subnet_flex.num_subnet_public) # Recorre la longitud de la variable con los CIDR
  tags = {
    Name = "Public Subnet ${count.index + 1}-${local.project_06}"
  }
}

# Subred privada que recorre los diferentes cidr de la variables de subred
resource "aws_subnet" "subnet_private" {
  vpc_id   = aws_vpc.vpc.id
  for_each = var.subnet_flex.num_subnet_private
  # Recorre nuestra variable map con los CIDR
  cidr_block = each.value
  tags = {
    Name = "Private Subnet ${each.key}-${local.project_06}"
  }

}

# NAT Gateway para conectarnos o no a internet de forma segura desde una subred privada
resource "aws_nat_gateway" "nat_gw" {
  count      = var.nat_gw ? 1 : 0
  subnet_id  = aws_subnet.subnet_public[0].id
  depends_on = [aws_internet_gateway.ig]
  tags = {
    Name = "GW NAT-${local.project_06}"
  }
}
# Internet Gateway 
resource "aws_internet_gateway" "ig" {
  count  = var.igw_deny_or_allow == "allow" ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw-${local.project_06}"
  }

}

# Tabla de enrutamiento pública que apunta al Internet Gateway
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig[0].id
  }
  tags = {
    Name = "rt-public-${local.project_06}"
  }
}
# Asociación con la tablade enrutamiento pública que se conecta con las distinas subredes
resource "aws_route_table_association" "rt_association_public" {
  count          = length(aws_subnet.subnet_public)
  subnet_id      = aws_subnet.subnet_public[count.index].id
  route_table_id = aws_route_table.rt_public.id
}

# Tabla de enrutamiento privada que apunta a NAT Gateway 
resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[0].id
  }
  tags = {
    Name = "rt-private-${local.project_06}"
  }
}
# Asociación con la tabla de enrutamiento privada que recorre la distintas subreds
resource "aws_route_table_association" "rt_association_private" {
  for_each       = aws_subnet.subnet_private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt_private.id
}

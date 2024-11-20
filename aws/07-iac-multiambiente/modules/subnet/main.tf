resource "aws_subnet" "subnets" {
  for_each = merge(var.subnet_public, var.subnet_private)

  vpc_id                  = var.vpc_id
  cidr_block              = each.value.subnet_cidr
  map_public_ip_on_launch = each.value.subnet_ip_assign

  tags = {
    Name = each.value.subnet_name
  }
}
resource "aws_route_table_association" "associations" {
  for_each = merge(
    { for key, subnet in var.subnet_public : key => { subnet_id = aws_subnet.subnets[key].id, route_table_id = aws_route_table.route_table_public.id } },
    { for key, subnet in var.subnet_private : key => { subnet_id = aws_subnet.subnets[key].id, route_table_id = aws_route_table.route_table_private.id } }
  )
  subnet_id      = each.value.subnet_id
  route_table_id = each.value.route_table_id
}

resource "aws_route_table" "route_table_private" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.route_table_private_name
  }

}

resource "aws_route_table" "route_table_public" {
  vpc_id = var.vpc_id
  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = var.igw_cidr_block
  }
  tags = {
    Name = var.route_table_public_name
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_name
  }
}
resource "aws_eip" "nat_eip" {
  for_each = var.subnet_public

}

resource "aws_nat_gateway" "ngw" {
  for_each = var.subnet_public

  allocation_id = aws_eip.nat_eip[each.key].id
  subnet_id     = aws_subnet.subnets[each.key].id

  tags = {
    Name = "${var.ngw_name}-${each.key}"
  }
}

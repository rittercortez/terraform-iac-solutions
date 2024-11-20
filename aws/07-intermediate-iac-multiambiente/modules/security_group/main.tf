resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.sg_list_port_ingress
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = var.sg_ip_protocol
      cidr_blocks = [var.default_route_cidr]
    }
  }
  egress {
    from_port   = var.egress_rules.rule_all.from_port
    to_port     = var.egress_rules.rule_all.to_port
    protocol    = var.egress_rules.rule_all.protocol
    cidr_blocks = var.egress_rules.rule_all.cidr_blocks

  }
  tags = {
    Name = "${var.sg_name}-${var.environment}"
  }
}

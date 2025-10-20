module "vpc_test" {
  source   = "/home/project/lab-terraform/07-iac-multiambiente/modules/vpc"
  vpc_cidr = var.vpc_cidr_test
  vpc_name = "${var.vpc_name_test}-${var.environment}"
}

module "subnets_test" {
  source                   = "/home/project/lab-terraform/07-iac-multiambiente/modules/subnet"
  vpc_id                   = module.vpc_test.vpc_id
  subnet_public            = var.subnet_public_test
  subnet_private           = var.subnet_private_test
  igw_name                 = var.igw_name_test
  igw_cidr_block           = var.igw_cidr_block_test
  ngw_name                 = var.ngw_name_test
  route_table_public_name  = var.route_table_public_name_test
  route_table_private_name = var.route_table_private_name_test

}
module "security_group_test" {
  source               = "/home/project/lab-terraform/07-iac-multiambiente/modules/security_group"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr_test
  vpc_id               = module.vpc_test.vpc_id
  sg_name              = var.sg_name_test
  sg_list_port_ingress = var.sg_list_port_ingress_test
  sg_ip_protocol       = var.sg_ip_protocol_test
  default_route_cidr   = var.default_route_cidr_test
  egress_rules         = var.egress_rules_test
}

module "instance_test" {
  source         = "/home/project/lab-terraform/07-iac-multiambiente/modules/instance"
  environment    = var.environment
  security_group = module.security_group_test.sg_id

  instance_name   = var.instance_name_test
  instance_type   = var.instance_type_test
  instance_amount = var.instance_amount_test
  instance_ami    = var.instance_ami_test
  instance_script = var.instance_script_test
}


output "vpc_id" {
  value = module.vpc_test.vpc_id
}
output "security_group_rule" {
  value = module.security_group_test.sg_rules_ingress
}

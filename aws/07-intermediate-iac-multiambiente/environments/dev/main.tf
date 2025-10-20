module "vpc_dev" {
  source   = "/home/project/lab-terraform/07-iac-multiambiente/modules/vpc"
  vpc_cidr = var.vpc_cidr_dev
  vpc_name = "${var.vpc_name_dev}-${var.environment}"
}

module "subnets_dev" {
  source                   = "/home/project/lab-terraform/07-iac-multiambiente/modules/subnet"
  vpc_id                   = module.vpc_dev.vpc_id
  subnet_public            = var.subnet_public_dev
  subnet_private           = var.subnet_private_dev
  igw_name                 = var.igw_name_dev
  igw_cidr_block           = var.igw_cidr_block_dev
  ngw_name                 = var.ngw_name_dev
  route_table_public_name  = var.route_table_public_name_dev
  route_table_private_name = var.route_table_private_name_dev

}
module "security_group_dev" {
  source               = "/home/project/lab-terraform/07-iac-multiambiente/modules/security_group"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr_dev
  vpc_id               = module.vpc_dev.vpc_id
  sg_name              = var.sg_name_dev
  sg_list_port_ingress = var.sg_list_port_ingress_dev
  sg_ip_protocol       = var.sg_ip_protocol_dev
  default_route_cidr   = var.default_route_cidr_dev
  egress_rules         = var.egress_rules_dev
}

module "instance_dev" {
  source         = "/home/project/lab-terraform/07-iac-multiambiente/modules/instance"
  environment    = var.environment
  security_group = module.security_group_dev.sg_id

  instance_name   = var.instance_name_dev
  instance_type   = var.instance_type_dev
  instance_amount = var.instance_amount_dev
  instance_ami    = var.instance_ami_dev
  instance_script = var.instance_script_dev
}



output "vpc_id" {
  value = module.vpc_dev.vpc_id
}
output "security_group_rule" {
  value = module.security_group_dev.sg_rules_ingress
}
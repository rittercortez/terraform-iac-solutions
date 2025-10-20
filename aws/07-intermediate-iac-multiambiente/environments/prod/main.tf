module "vpc_prod" {
  source   = "/home/project/lab-terraform/07-iac-multiambiente/modules/vpc"
  vpc_cidr = var.vpc_cidr_prod
  vpc_name = "${var.vpc_name_prod}-${var.environment}"
}

module "subnets_prod" {
  source                   = "/home/project/lab-terraform/07-iac-multiambiente/modules/subnet"
  vpc_id                   = module.vpc_prod.vpc_id
  subnet_public            = var.subnet_public_prod
  subnet_private           = var.subnet_private_prod
  igw_name                 = var.igw_name_prod
  igw_cidr_block           = var.igw_cidr_block_prod
  ngw_name                 = var.ngw_name_prod
  route_table_public_name  = var.route_table_public_name_prod
  route_table_private_name = var.route_table_private_name_prod

}
module "security_group_prod" {
  source               = "/home/project/lab-terraform/07-iac-multiambiente/modules/security_group"
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr_prod
  vpc_id               = module.vpc_prod.vpc_id
  sg_name              = var.sg_name_prod
  sg_list_port_ingress = var.sg_list_port_ingress_prod
  sg_ip_protocol       = var.sg_ip_protocol_prod
  default_route_cidr   = var.default_route_cidr_prod
  egress_rules         = var.egress_rules_prod
}

module "instance_prod" {
  source         = "/home/project/lab-terraform/07-iac-multiambiente/modules/instance"
  environment    = var.environment
  security_group = module.security_group_prod.sg_id

  instance_name   = var.instance_name_prod
  instance_type   = var.instance_type_prod
  instance_amount = var.instance_amount_prod
  instance_ami    = var.instance_ami_prod
  instance_script = var.instance_script_prod
}

output "vpc_id" {
  value = module.vpc_prod.vpc_id
}
output "ec2_id" {
  value = module.instance_prod.instance_ids
}
output "security_group_rule" {
  value = module.security_group_prod.sg_rules_ingress
}
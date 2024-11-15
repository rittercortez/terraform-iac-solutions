module "vpc_dev" {
  source        = "/home/project/lab-terraform/modules-practice/vpc-subnet/modules"
  vpc_cidr = var.vpc_cidr_dev
}

module "vpc_subnet" {
  source        = "/home/project/lab-terraform/modules-practice/vpc-subnet/modules"
  vpc_id = module.vpc_dev.vpc_id
  subnet_cidr = var.subnet_public_dev
}


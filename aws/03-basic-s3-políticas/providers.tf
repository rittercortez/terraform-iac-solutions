# En este archivos tendremos los providers (AWS y random) y los recursos por defectos que necesitamos

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.regiones.virginia
  default_tags {
    tags = {
      Owner = "SoyRitter"
    }
  }
}
provider "random" {
  
}

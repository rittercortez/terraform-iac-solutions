# Aqui esta todos los requerimientos de los providers que necesitamos para el despliegue
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.regiones.virginia # Especifica la región aquí
  default_tags {
    tags = {
      Environment = "Desarrollo"
      Owner       = "Ritter"
    }
  }
}


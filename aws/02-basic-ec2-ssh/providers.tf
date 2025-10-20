# Aqui están todos los providers necesarios que utilizaremos en este proyecto
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.regiones.ohio  # Especifica la región aquí
  default_tags {
    tags = {
      Environment = "Desarrollo"
      Owner       = "SoyRitter"
    }
  }
}

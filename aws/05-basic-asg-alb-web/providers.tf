# En este archivos tendremos los providers y los recursos por defectos que necesitamos
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

/* provider "aws" {
  region = var.regiones.Virginia
  default_tags {
    tags = {
      Environment = "Desarrollo"
      Owner = "SoyRitter"
    }  
  }  
} */
provider "aws" {
  region                      = var.regiones["Virginia"]
  access_key                  = local.localstack_accesskey
  secret_key                  = local.localstack_secretkey
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  default_tags {
    tags = {
      Owner     = local.Owner
      ManagedBy = local.ManagedBy
      Version   = local.Version
    }
  }
  endpoints {
    ec2 = local.container #EC2 en el puerto predeterminado de LocalStack
    s3  = local.container # S3 en el mismo puerto
  }
}

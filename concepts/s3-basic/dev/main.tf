module "s3_bucket" {
  source      = "/home/project/lab-terraform/modules-practice/s3/modules/s3"
  bucket_name = var.bucket_name
  tags = {
    Owner       = var.tags["Owner"]
    Version     = var.tags["Version"]
    Environment = local.environment
    ManagedBy   = local.managedBy
  }
}

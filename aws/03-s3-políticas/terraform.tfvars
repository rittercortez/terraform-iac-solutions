regiones = {
  "virginia" = "us-east-1"
  "ohio"     = "us-east-2"
}
usuarios = ["arn_iam_user"] # Sustituir por ARN del usuario IAM 
buckets = {
  bucket_versioning_key    = "pruebakey"
  bucket_versioning_source = "version_principal.txt"
  bucket_logging_prefix    = ["log"]
  tags = {
    "Name"       = "Dev-Bucket"
    "Environment" = "Desarrollo"
  }
}
policys = {
  policy_access_type = "AWS"
  policy_access_actions = {
    read = [
      "s3:GetObject",
      "s3:ListBucket"
      ]
    read_writte = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
      "s3:DeleteObject"
      ]
  }

}

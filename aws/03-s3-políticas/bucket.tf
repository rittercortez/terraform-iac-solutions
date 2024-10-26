# Bucket S3 con sufijo creado con el provider random
resource "aws_s3_bucket" "bucket_principal" {
  bucket = "bucket-dev-${random_string.random.id}"
  tags = {
    Name        = var.buckets.tags.Name
    Environment = var.buckets.tags.Environment
  }
}

# Política de acceso a nuestro Bucket 
resource "aws_s3_bucket_policy" "policy_access_s3" {
  bucket = aws_s3_bucket.bucket_principal.id
  policy = data.aws_iam_policy_document.policy_access_s3.json
}

data "aws_iam_policy_document" "policy_access_s3" {
  statement {
    # Permitir el acceso a los usuarios autorizados en var.usuarios[0]
    principals {
      type        = "AWS"
      identifiers = [var.usuarios[0]] # Esta variables nos obliga a identificarnos con el ARN del usuario IAM
    }
    # Estás acciones nos permite Leer y editar el bucket
    actions = var.policys.policy_access_actions.read_writte

    resources = [
      aws_s3_bucket.bucket_principal.arn,
      "${aws_s3_bucket.bucket_principal.arn}/*",
    ]
  }

  statement {
    # Bloquear acceso público a todos los demás
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"] # Cualquier usuario
    }

    actions = var.policys.policy_access_actions.read

    resources = [
      aws_s3_bucket.bucket_principal.arn,
      "${aws_s3_bucket.bucket_principal.arn}/*",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
  }
}


# Crear el bucket S3 para versionung
resource "aws_s3_bucket" "versioning_mybucket" {
  bucket = "my-versioned-bucket-${random_string.random.id}"

  tags = {
    Name = "MyVersionedBucket"
  }
}

# Configurar el versionado del bucket S3
resource "aws_s3_bucket_versioning" "versioning_config" {
  bucket = aws_s3_bucket.versioning_mybucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}


# Logging - para este servicio tenemos que configurar  un bucket aparte para cargar los registros
resource "aws_s3_bucket" "log_bucket" {
  bucket = "log-bucket-${random_string.random.id}"  # Usa guion en lugar de guion bajo
}

resource "aws_s3_bucket_logging" "logging_principal" {
  bucket = aws_s3_bucket.log_bucket.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = var.buckets.bucket_logging_prefix[0]
}

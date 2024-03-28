resource "aws_kms_key" "kms" {
  description             = "S3 bucket KMS"
  deletion_window_in_days = 7
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"

  depends_on = [
    aws_s3_bucket.bucket
  ]
}

resource "aws_s3_object" "file" {
  bucket     = aws_s3_bucket.bucket.id
  key        = "file.txt"
  kms_key_id = aws_kms_key.kms.arn

  content      = jsonencode({"app": "test"})
  content_type = "application/json"
}

data "aws_s3_object" "content" {
  bucket = aws_s3_bucket.bucket.id
  key    = aws_s3_object.file.key

  depends_on = [
    aws_s3_object.file
  ]
}

output "content" {
  value = data.aws_s3_object.content.body
}
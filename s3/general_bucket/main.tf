resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  tags = var.tags

  versioning {
    enabled = var.enable_versioning
  }

}
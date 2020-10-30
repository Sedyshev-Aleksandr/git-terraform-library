resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.bucket_acl
  policy = var.bucket_policy
  tags   = var.tags
  versioning {
    enabled = var.enable_versioning
  }
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
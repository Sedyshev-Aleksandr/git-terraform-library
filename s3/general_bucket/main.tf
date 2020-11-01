local {
  bucket_name = "${var.bucket_name}-${var.env}"
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
  acl    = var.bucket_acl
  tags   = var.tags

  versioning {
    enabled = var.enable_versioning
  }
}
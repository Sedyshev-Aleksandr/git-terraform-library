local {
  bucket_name = "${var.bucket_name}-${var.env}"
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name
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
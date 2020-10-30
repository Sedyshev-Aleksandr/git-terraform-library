resource "aws_s3_bucket_object" "this" {
    bucket       = var.bucket_name
    acl          = var.bucket_acl
    key          = var.bucket_key
    content_type = var.content_type
}
resource "aws_s3_bucket_object" "this" {
  for_each      = fileset(var.upload_directory, "**/*.*")
  bucket        = var.bucket_name
  key           = replace("${var.bucket_key}${each.value}", var.upload_directory, "")
  source        = "${var.upload_directory}${each.value}"
  acl           = var.bucket_acl
  content_type  = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}
output "key" {
  description = "Bucket key"
  value       = aws_s3_bucket_object.this.key
}

output "name" {
  description = "Bucket name"
  value       = aws_s3_bucket_object.this.bucket
}

output "id" {
  description = "Bucket id"
  value       = aws_s3_bucket_object.this.id
}
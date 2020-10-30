output "id" {
  description = "Bucket id"
  value       = [for u in aws_s3_bucket_object.this:u.id]
}
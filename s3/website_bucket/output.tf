output "arn" {
  value = aws_s3_bucket.this.arn
}

output "name" {
  value = aws_s3_bucket.this.bucket
}

output "id" {
  value = aws_s3_bucket.this.id
}

output "website_endpoint" {
  value = aws_s3_bucket.this.website_endpoint
}

output "website_domain" {
  value = aws_s3_bucket.this.website_domain
}

output "hosted_zone_id" {
  value = aws_s3_bucket.this.hosted_zone_id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}
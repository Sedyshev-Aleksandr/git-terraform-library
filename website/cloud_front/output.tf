output "cloud_front_arn"     {value = aws_cloudfront_distribution.this.arn}
output "cloud_front_id"      {value = aws_cloudfront_distribution.this.id}
output "route53_record_a_zone_id" {value = aws_route53_record.this.zone_id}
output "route53_record_a_name"    {value = aws_route53_record.this.name}
output "route53_record_a_type"    {value = aws_route53_record.this.type}
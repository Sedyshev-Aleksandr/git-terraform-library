output "certificate_arn" {value = aws_acm_certificate.this.arn}
output "certificate_id"   {value = aws_acm_certificate.this.id}
output "certificate_name" {value = aws_acm_certificate.this.name}
output "route53_record_zone_id" {value = values(aws_route53_record.this)[0].zone_id}
output "route53_record_name"    {value = values(aws_route53_record.this)[0].name}
output "route53_record_type"    {value = values(aws_route53_record.this)[0].type}
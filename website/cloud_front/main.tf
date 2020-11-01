locals {
  domain_name       = "${var.domain_name}-${var.env}.com"
  s3_website_bucket = "S3-${var.s3_website_bucket}"
}


resource "aws_cloudfront_origin_access_identity" "this" {}

resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = var.bucket_regional_name
    origin_id   = local.s3_website_bucket
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }
  
  # By default, show index.html file
  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true
  aliases             = [local.domain_name]

  # If there is a 404, return index.html with a HTTP 200 Response
  custom_error_response {
    error_caching_min_ttl = 3000
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
  }
  
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_website_bucket
    
    # Forward all query strings, cookies and headers
    forwarded_values {
      query_string = true
       cookies {
          forward = "none"
       }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }
  
  # Distributes content to US and Europe
  price_class = "PriceClass_100"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  # SSL certificate for the service.
  viewer_certificate {
    acm_certificate_arn = var.certificate_arn
    ssl_support_method  = "sni-only"
  }  
}

resource "aws_route53_record" "this" {

  zone_id  = var.zone_id
  name     = local.domain_name
  type     = "A"
  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}

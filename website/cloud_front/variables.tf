# Required variables:
variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "bucket_regional_name" {
  type = string
}

variable "s3_website_bucket" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "certificate_arn" {
  type = string 
}

variable "zone_id" {
  type = string 
}
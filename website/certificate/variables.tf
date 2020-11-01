# Required variables:
variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "domain_name" {
  type        = string
}

variable "zone_id" {
  type        = string
}
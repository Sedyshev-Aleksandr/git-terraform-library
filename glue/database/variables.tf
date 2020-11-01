# Required variables:
variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "database_name" {
  description = "Database name in the (Data catalog) of Glue service"
  type        = string
}

#Optional variables - default values used unless others specified:
variable "database_description" {
  description = "Description of what database is for"
  type        = string
  default     = "No description given"
}
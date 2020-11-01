# Required variables:
variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "parent_module_path" {
  description = "Path of the parent module - to be used for naming resources etc"
  type        = string
}

variable "cron_expression" {
  description = "Cron expression describing when to invoke lambda"
  type        = string
}

variable "iam_role_arn" {
  description = "Arn of the iam role with permission to execute step function"
  type        = string
}

variable "step_function_arn" {
  description = "Arn of the generated step function"
  type        = string
}

variable "module_name" {
  description = "Name of child module - default value ok if module contains only one instance"
  type        = string
}

#Optional variables - default values used unless others specified:

variable "resource_tags" {
  description = "Defaults to no tags. If needed, env vars can be given in parent module variables.tf, and assigned in child module call"
  type        = map(string)
  default = {
    "tag" = "none given"
  }
}

variable "description" {
  description = "Description of the cron setup"
  type        = string
  default     = "No description given"
}
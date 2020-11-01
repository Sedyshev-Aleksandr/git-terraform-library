# Required variables:
variable "env" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "parent_module_path" {
  description = "Path of the parent module - to be used for naming resources etc"
  type        = string
}

variable "lambda_script_source_dir" {
  description = "Directory of lambda package source"
  type        = string
}

variable "lambda_script_output_path" {
  description = "Path to zipped lambda package"
  type        = string
}

variable "module_name" {
  description = "Name of child module - used to create resource name"
  type        = string
}

#Optional variables - default values used unless others specified:

variable "lambda_runtime" {
  description = "Runtime environment to be used when executing lambda"
  type        = string
  default     = "python3.7"
}

variable "description" {
  description = "Description of what lambda function does"
  type        = string
  default     = "No description given"
}


variable "additional_file_include" {
  description = "option to include script file from other location"
  type = string
  default = false
}

variable "additional_file_path" {
  description = "path to additional file"
  type = string
  default = "./"
}

variable "additional_file_target" {
  description = "target location for additional file."
  type = string
  default = "./"
}

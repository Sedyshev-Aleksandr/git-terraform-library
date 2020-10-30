# Resource/function: lambda layer

## Purpose
Generic code for generating lambda layer including generation of zip package.

## Description
Establishes a lambda layer using standardized naming and input, including generation of script package from folder. 

## Terraform functions

### Data sources
- `archive_file`
    - generates .zip file from folder

### Resources
- `local_file`
    - copies file from any location into .zip source folder
- `aws_lambda_layer_version` 
    - establishes lambda layer 

## Input variables
### Required
- `parent_module_path`
    - path of the module that calls this resource/function
- `lambda_script_source_dir`
    - path to folder containing all files to be uploaded in .zip
- `lambda_script_output_path`
    - path where .zip file will be stored locally
- `module_name`
    - name of child module - used to create resource name

### Optional (default values used unless specified)
- `lambda_runtime`
    - Runtime environment that the layer is compatible with
    - default: `python3.7`
- `description`
    - description of layer
    - default: `No description given`
- `additional_file_include`
    - option to include script file from other location than `lambda_script_source_dir`. Accepts `true` or `false`.
    - default: `false`
- `additional_file_path`
    - path to additional file
    - default: `./`
- `additional_file_target`
    - target location for additional file. Must be inside `lambda_script_source_dir`. 
    - default: `./`


## Output variables
- `arn`
    - `arn` of the lambda layer including version


## Example use
The below example generates a lambda layer as a module using the terraform scripts from `lambda_script_source_dir`. 


```sql
module "lambda_layer_general_functions" {
  source                    = "git::https://github.oslo.kommune.no/REN/aws-reg-terraform-library//lambda/layer?ref=0.23.dev"
  parent_module_path        = path.module
  lambda_script_source_dir  = "./library/layers/reg_general_functions"
  lambda_script_output_path = join("", [path.module, "/zip_package/"])
  module_name               = "lambda_layer_general_functions"
}
```

## Further work

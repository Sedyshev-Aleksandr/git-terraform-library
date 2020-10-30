# Resource/function: Step function

## Purpose
Generic code for generating step function.

## Description
Generates a step function based on a template file.  

## Terraform functions

### Data sources

### Resources
- `aws_sfn_state_machine`
    - generates the step function based on an input `templatefile` and associated variables.

## Input variables
### Required
- `parent_module_path`
    - path of the module that calls this resource/function
- `iam_role_arn`
    - arn of iam role to be used by lambda script
- `template_file_source_dir`
    - path to template file
- `module_name`
    - name of child module - used to create resource name

### Optional (default values used unless specified)
- `resource_tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `variableA`
    - optional variable to be sent to template file
    - default: `empty`
- `variableB`
    - optional variable to be sent to template file
    - default: `empty`
- `variableC`
    - optional variable to be sent to template file
    - default: `empty`
- `variableD`
    - optional variable to be sent to template file
    - default: `empty`
- `variableE`
    - optional variable to be sent to template file
    - default: `empty`
- `variableF`
    - optional variable to be sent to template file
    - default: `empty`
- `variableG`
    - optional variable to be sent to template file
    - default: `empty`
- `variableH`
    - optional variable to be sent to template file
    - default: `empty`
- `variableI`
    - optional variable to be sent to template file
    - default: `empty`
- `variableJ`
    - optional variable to be sent to template file
    - default: `empty`

## Output variables
- `arn`
    - `arn` of the step function

## Example use
The below example generates a step function as a module using the terraform scripts from `source`, defining the step function from `template_file_source_dir` with input from variables `variableA`, `variableB`, `variableC` and `variableD`.
```sql
module "step_function" {
  source                   = "git::https://github.oslo.kommune.no/REN/aws-reg-terraform-library//step_function?ref=0.17.dev"
  parent_module_path       = path.module
  iam_role_arn             = module.iam_role_for_step_function.arn
  template_file_source_dir = join("", [path.module, "/step_function_template/workflow.json.tpl"])
  variableA                = module.lambda_download_to_s3.arn
  variableB                = module.lambda_raw_to_processed.arn
  variableC                = module.lambda_raw_to_origo.arn
  variableD                = module.lambda_result_to_slack.arn
  resource_tags            = var.resource_tags
  module_name              = "step_function"
}
```

An example of the template file is given below. Template files or of type `.json.tpl`.
```sql
${jsonencode({
  "Comment": "Step1: downloads webdeb standplasser for area R into S3 raw - Step 2: sends report to slack",
  "StartAt": "Download",
  "States": {
    "Download": {
      "Type": "Task",
      "Resource": "${variableA}",
      "TimeoutSeconds": 900,
      "Next": "Report"
    },
    "Report": {
      "Type": "Task",
      "Resource": "${variableB}",
      "TimeoutSeconds": 100,
      "End": true
    }
  }
})}
````

## Further work

# Resource/function: cloudwatch/cron_for_step_function

## Purpose
Generic code for generating a cron job for step functions

## Description
Generates and activates cron job for a step function.

## Terraform functions

### Data sources

### Resources
- `aws_cloudwatch_event_rule`
    - provides the rule (here schedule expression) to be used by the event target 
- `aws_cloudwatch_event_target` 
    - links the event rule to the event target arn

## Input variables
### Required
- `parent_module_path`
    - path of the module that calls this resource/function
- `cron_expression`
    - cron expression describing when to invoke step function (both cron() and rate() are allowed)
- `iam_role_arn`
    - arn of the iam role with permission to execute step function
- `step_function_arn`
    - arn of the generated step function
- `module_name`
    - name of child module - used to create resource name

### Optional (default values used unless specified)
- `resource_tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `description`
    - description of role
    - default: `No description given`

## Output variables


## Example use
The below example generates a cron job for a step function as a module using the terraform scripts from `source`.
```sql
module "cron_for_step_function" {
  source             = "git::https://github.oslo.kommune.no/REN/aws-reg-terraform-library//cloudwatch/cron_for_step_function?ref=0.17.dev"
  parent_module_path = path.module
  #cron_expression           = "rate(5 minutes)"
  cron_expression   = "cron(0 0 ? * MON-FRI *)"
  iam_role_arn      = module.iam_role_for_cron.arn
  resource_tags     = var.resource_tags
  step_function_arn = module.step_function.arn
  module_name       = "cron_for_step_function"
}
```

## Further work

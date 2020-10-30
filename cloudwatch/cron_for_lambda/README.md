# Resource/function: cloudwatch/cron_for_lamdba

## Purpose
Generic code for generating a cron job for lambda functions

## Description
Generates and activates cron job for a step function.

## Terraform functions

### Data sources

### Resources
- `aws_cloudwatch_event_rule`
    - provides the rule (here schedule expression) to be used by the event target 
- `aws_cloudwatch_event_target` 
    - links the event rule to the event target arn
- `aws_lambda_permission` 
    - generates the permission for cloudwatch to invoke the lambda function

## Input variables
### Required
- `parent_module_path`
    - path of the module that calls this resource/function
- `cron_expression`
    - cron expression describing when to invoke lambda (both cron() and rate() are allowed)
- `lambda_function_arn`
    - arn of the lambda function to be invoked
- `lambda_function_function_name`
    - function name of the lambda function to be invoked
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
The below example generates a cron job for a lambda function as a module using the terraform scripts from `source`.
```sql

```

## Further work

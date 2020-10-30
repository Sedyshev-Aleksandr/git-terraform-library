# Resource/function: IAM/role

## Purpose
Generic code for generating IAM role.

## Description
Generates a IAM role based on input `policy.json` and `assume-policy.json` (not restricted to these names), for use by a aws resource. 

## Terraform functions

### Data sources

### Resources
- `aws_iam_role`
    - provides a iam role
- `aws_iam_role_policy` 
    - defines and attaches the policy document to the role

## Input variables
### Required
- `permission_boundary`
    - arn of permission boundary required to generate roles. 
- `parent_module_path`
    - path of the module that calls this resource/function
- `assume_policy_path`
    - path to the assume-policy .json-document
- `policy_path`
    - path to policy .json-document
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
- `arn`
    - `arn` of the generated role

## Example use
The below example generates a iam role as a module using the terraform scripts from `source`, giving the permissions defined in `policy_path`.
```sql
module "iam_role_for_lambda" {
  source              = "git::https://github.oslo.kommune.no/REN/aws-reg-terraform-library//iam/role?ref=0.17.dev"
  parent_module_path  = path.module
  permission_boundary = var.permission_boundary
  assume_policy_path  = file(join("", [path.module, "/iam/lambda-role-assume-policy.json"]))
  policy_path         = file(join("", [path.module, "/iam/lambda-role-policy.json"]))
  resource_tags       = var.resource_tags
  module_name         = "iam_role_for_lambda"
}
```

## Further work

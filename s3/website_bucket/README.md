# Resource/function: s3/website_bucket

## Purpose
Generic code for generating public s3 buckets for website

## Description
Generates website s3 buckets.

## Terraform functions

### Data sources

### Resources
- `aws_s3_bucket`
    - generates the bucket

## Input variables
### Required
- `bucket_name`
    - defines the name of the bucket
- `policy_name`
    - defines the policy to indicate the allowed resource

### Optional (default values used unless specified)
- `tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `bucket_acl`
    - Canned acl to be used - see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options
    - default: `"public-read"`
- `enable_versioning`
    - Boolean for enabling bucket versioning - cannot be turned off once on
    - default: `false`


## Output variables
- `arn`
    - `arn` of the generated bucket
- `name`
    - `name` of the generated bucket
- `id`
    - `id` of the generated bucket
- `website_endpoint`
    - `website_endpoint` of the generated bucket

## Example use
The below example generates a bucket using default input where available.
```sql

```

## Further work

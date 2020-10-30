# Resource/function: s3/create_folder

## Purpose
Create folder in the specific s3 bucket

## Description
Generates folders inside s3 buckets.

## Terraform functions

### Data sources

### Resources
- `aws_s3_bucket_object`
    - generates the key in the bucket

## Input variables
### Required
- `bucket_name`
    - defines the name of the bucket
- `bucket_key`
    - defines the name of the folder (key)    

### Optional (default values used unless specified)
- `tags`
    - tags added to role - should be specified jointly with all other resources in the same module
    - default: `"tag" = "none given"`
- `bucket_acl`
    - Canned acl to be used - see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options
    - default: `"private"`
- `content_type`
    - default: `application/x-directory`


## Output variables
- `arn`
    - `arn` of the generated bucket
- `name`
    - `name` of the generated bucket
- `id`
    - `id` of the generated bucket

## Example use
The below example generates a bucket using default input where available.
```sql

```

## Further work

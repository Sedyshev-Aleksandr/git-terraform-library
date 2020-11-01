# aws-reg-terraform-library

## Purpose
This library contains standardized resources/functions for building aws modules. The target is to build each resource/function such that they can be used together by referencing them as modules without the need of specifying any further connection.  

## Layout
The library contains separate folders for each resource/function to biuld. Within each folder, the following Terraform files are located:
- `main.tf` - contains the detailed code for how the resource/function shall be built.
- `variables.tf` - contains input variables to `main.tf`
- `output.tf` - contains output variables to be passed to other resources/functions

Each folder also contains a `README.md` describing functionality and dependency of each file. 

## Structure
The following shows the currently available resources/functions and their location in the library:

    .
    ├── api_gateway
    │    ├── rest_api_for_lambda
    ├── cloudwatch
    │    ├── cron_for_lambda
    │    ├── cron_for_step_function
    ├── iam
    │    ├── role
    ├── lambda
    │    ├── function  
    │    ├── layer
    ├── s3
    │    ├── create_folder  
    │    ├── general_bucket
    │    ├── upload_files  
    │    ├── website_bucket   
    ├── step_function

## Tagging
All script files pushed to this repo should be tagged in accordance with the git-tagging policy. After pushing, use the following commands:
- `git tag -a yourtag -m "comment"`
- `git push --follow-tags`

## Example
- `git tag --delete 0.35.dev`
- `git tag -a 0.35.dev -m "new env variable, new website services"`
- `git push --follow-tags`


## Further work
- Consider making `resource_tags` as required
resource "aws_sfn_state_machine" "this" {
  name       = join("", [basename(var.parent_module_path), "-", var.module_name,"-",var.env])
  role_arn   = var.iam_role_arn
  definition = var.template_file
  tags       = var.resource_tags
}
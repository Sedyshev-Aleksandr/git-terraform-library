
# Generates a cloudwatch event rule to trigger
resource "aws_cloudwatch_event_rule" "this" {
  name                = join("", [basename(var.parent_module_path), "-", var.module_name, "-", var.env])
  schedule_expression = var.cron_expression
  description         = var.description
  role_arn            = var.iam_role_arn
  tags                = var.resource_tags
}

# Assigns the cloudwath event rule to the target
resource "aws_cloudwatch_event_target" "this" {
  rule = aws_cloudwatch_event_rule.this.name
  arn  = var.step_function_arn
  role_arn = var.iam_role_arn
}

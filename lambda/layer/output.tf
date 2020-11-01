output "arn" {
  description = "layer arn"
  value       = aws_lambda_layer_version.this.arn
}

output "layer_name" {
  description = "layer name"
  value       = aws_lambda_layer_version.this.layer_name
}
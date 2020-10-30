output "arn" {
  value = (var.source_type == "json") ? aws_glue_catalog_table.json_table[0].arn : aws_glue_catalog_table.csv_table[0].arn 
}

output "id" {
  value = (var.source_type == "json") ? aws_glue_catalog_table.json_table[0].id : aws_glue_catalog_table.csv_table[0].id 
}

output "name" {
  value = (var.source_type == "json") ? aws_glue_catalog_table.json_table[0].name : aws_glue_catalog_table.csv_table[0].name 
}
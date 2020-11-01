local {
  database_name = "${var.database_name}-${var.env}"
}

resource "aws_glue_catalog_database" "this" {
  name = local.database_name
  description = var.database_description
}
local {
  table_name = "${var.table_name}-${var.env}"
}

//--------------------------
resource "aws_glue_catalog_table" "csv_table" {
  count = (var.source_type == "csv") ? 1 : 0
  name          = local.table_name
  database_name = var.database_name
  table_type    = "EXTERNAL_TABLE"

  parameters = {
    classification=var.source_type
    "skip.header.line.count"="1" 
    "typeOfData"="file"  
  }

  storage_descriptor {
    location      = var.location
    input_format  = var.input_format
    output_format = var.output_format

    ser_de_info {
      name = "my-store-serde"  
      serialization_library = var.serialization_library[var.source_type]
      parameters = {
        "serialization.format" = 1
        "separatorChar"= var.separators 
      }
    } 
    dynamic "columns" {
      for_each = var.columns
      content {
        name   = columns.value["name"]
        type   = columns.value["type"]
      }
    }
  }

  dynamic "partition_keys" {
    for_each = var.partition_keys
    content {
        name   = partition_keys.value["name"]
        type   = partition_keys.value["type"]
    }
  }
}

//-----------------------------------------
resource "aws_glue_catalog_table" "json_table" {
  count = (var.source_type == "json") ? 1 : 0
  name          = local.table_name
  database_name = var.database_name
  table_type    = "EXTERNAL_TABLE"

  parameters = {
    classification= var.source_type
    "typeOfData"="file"  
  }

  storage_descriptor {
    location      = var.location
    input_format  = var.input_format
    output_format = var.output_format

    ser_de_info {
      name = "my-store-serde"  
      serialization_library = var.serialization_library[var.source_type]
    } 
    dynamic "columns" {
      for_each = var.columns
      content {
        name   = columns.value["name"]
        type   = columns.value["type"]
      }
    }
  }

  dynamic "partition_keys" {
    for_each = var.partition_keys
    content {
        name   = partition_keys.value["name"]
        type   = partition_keys.value["type"]
    }
  }
}
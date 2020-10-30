# Required variables:
variable "table_name" {
  description = "Table in the (Data catalog) of Glue service"
  type        = string
}

variable "database_name" {
  description = "Database name where table is located"
  type        = string
}

variable "source_type" {
  description = "Database type (csv, json)"
  type        = string
}

variable "location" {
  description = "Data location in s3"
  type        = string
}

#list of columns in map format: name=type (for ex.  column1="string")
variable "columns" {
  description = "List of columns and types"
  type = list(map(string))
}

#Optional variables - default values used unless others specified:
variable "separators" {
  description = "Column separator in csv file"
  type        = string
  default     = ";"
}

#list of partition keys in map format: name=type (for ex.  column1="string")
variable "partition_keys" {
  description = "List of partition keys"
  type = list(map(string))
  default = []
}

variable "serialization_library" {
  description = "Serialization library"
  type = map(string)
  default = {
    "csv":  "org.apache.hadoop.hive.serde2.OpenCSVSerde",
    "json": "org.openx.data.jsonserde.JsonSerDe"
  }
}

variable "input_format" {
  description = "Input format"
  type        = string
  default     = "org.apache.hadoop.mapred.TextInputFormat"
}

variable "output_format" {
  description = "Output format"
  type        = string
  default     = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"
}

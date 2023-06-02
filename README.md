# terraform-aws-dynamodb

Magicorn made Terraform Module for AWS Provider
--
```
module "dynamodb" {
  source      = "magicorntech/dynamodb/aws"
  version     = "0.0.1"
  tenant      = var.tenant
  name        = var.name
  environment = "test"

  # DynamoDB Table Configuration
  table_name             = "testbucket"
  hash_key               = "applianceId"
  range_key              = "uniqueDataKey"
  billing_mode           = "PAY_PER_REQUEST"
  table_class            = "STANDARD"
  deletion_protection    = true
  point_in_time_recovery = true
  sse_enabled            = true
  sse_kms                = null
  ttl_enabled            = true
  ttl_attribute_name     = "expirationTime"

  attributes = [
    {
      name = "count"
      type = "N"
    },
    {
      name = "uniqueDataKey"
      type = "S"
    },
    {
      name = "applianceId"
      type = "S"
    },
    {
      name = "processTime"
      type = "N"
    }
  ]

  global_secondary_indexes = [
    {
      name            = "gsi-processTime"
      hash_key        = "processTime"
      projection_type = "ALL"
    }
  ]

  local_secondary_indexes = [
    {
      name            = "lsi-count"
      range_key       = "count"
      projection_type = "ALL"
    }
  ]

}

```
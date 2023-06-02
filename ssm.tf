resource "aws_ssm_parameter" "name" {
  name        = "/${var.tenant}/${var.name}/${var.environment}/dynamodb/${var.table_name}/name"
  description = "Managed by Magicorn"
  type        = "SecureString"
  value       = aws_dynamodb_table.main.id

  tags = {
    Name        = "${var.tenant}-${var.name}-${var.environment}-dynamodb-${var.table_name}-name"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}
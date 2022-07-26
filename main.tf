/**
  *
  * Create a SSM Parameter Store resource.
  */

resource "random_password" "this" {
  length           = 32
  special          = false
  override_special = "_%@"
}

resource "aws_ssm_parameter" "this" {
  name            = var.name
  description     = var.description
  type            = var.type
  tier            = var.tier
  key_id          = var.key_id
  value           = length(var.value) == 0 ? random_password.this.result : var.value
  overwrite       = var.overwrite
  allowed_pattern = var.allowed_pattern
  data_type       = var.data_type
  tags            = var.tags
}

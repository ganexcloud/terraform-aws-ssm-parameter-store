resource "random_password" "this" {
  count            = var.value == "" ? 1 : 0
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
  value           = var.value == "" ? random_password.this[0].result : var.value
  overwrite       = var.overwrite
  allowed_pattern = var.allowed_pattern
  data_type       = var.data_type
  tags            = var.tags
}

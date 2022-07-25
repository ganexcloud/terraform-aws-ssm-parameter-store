output "arn" {
  description = "ARN of the parameter."
  value       = aws_ssm_parameter.this.arn
}

output "version" {
  description = "Version of the parameter."
  value       = aws_ssm_parameter.this.version
}

output "value" {
  description = "Value of the parameter."
  value       = var.value == "" ? random_password.this[0].result : var.value
}

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
  value       = length(var.value) == 0 ? random_password.this.result : var.value
}

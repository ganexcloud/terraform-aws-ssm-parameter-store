<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/3.3.2/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_pattern"></a> [allowed\_pattern](#input\_allowed\_pattern) | (Optional) Regular expression used to validate the parameter value. | `string` | `null` | no |
| <a name="input_data_type"></a> [data\_type](#input\_data\_type) | (Optional) Data type of the parameter. Valid values: text and aws:ec2:image for AMI format. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) Description of the parameter. | `string` | `null` | no |
| <a name="input_key_id"></a> [key\_id](#input\_key\_id) | (Optional) KMS key ID or ARN for encrypting a SecureString. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the parameter. | `string` | `""` | no |
| <a name="input_overwrite"></a> [overwrite](#input\_overwrite) | (Optional) Overwrite an existing parameter. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of tags to assign to the object. | `map(string)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | (Optional) Parameter tier to assign to the parameter. | `string` | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) Type of the parameter. Valid types are String, StringList and SecureString. | `string` | `""` | no |
| <a name="input_value"></a> [value](#input\_value) | (Required) Value of the parameter. If value is empty a random string will be generated. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the parameter. |
| <a name="output_value"></a> [value](#output\_value) | Value of the parameter. |
| <a name="output_version"></a> [version](#output\_version) | Version of the parameter. |
<!-- END_TF_DOCS -->
variable "name" {
  type        = string
  default     = ""
  description = "(Required) Name of the parameter. "
}

variable "type" {
  type        = string
  default     = ""
  description = "(Required) Type of the parameter. Valid types are String, StringList and SecureString."
}

variable "allowed_pattern" {
  type        = string
  default     = null
  description = "(Optional) Regular expression used to validate the parameter value."
}

variable "data_type" {
  type        = string
  default     = null
  description = "(Optional) Data type of the parameter. Valid values: text and aws:ec2:image for AMI format."
}

variable "description" {
  type        = string
  default     = null
  description = "(Optional) Description of the parameter."
}

variable "key_id" {
  type        = string
  default     = null
  description = "(Optional) KMS key ID or ARN for encrypting a SecureString."
}

variable "overwrite" {
  type        = bool
  default     = false
  description = "(Optional) Overwrite an existing parameter."
}

variable "tier" {
  type        = string
  default     = null
  description = "(Optional) Parameter tier to assign to the parameter."
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the object."
  type        = map(string)
  default     = {}
}

variable "value" {
  type        = string
  default     = ""
  description = "(Required) Value of the parameter. If value is empty a random string will be generated."
}

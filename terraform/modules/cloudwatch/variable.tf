variable "log_group_name" {
  type        = string
  description = "CloudWatch log group name"
}

variable "retention_days" {
  type        = number
  description = "Log retention in days"
}

variable "environment" {
  type        = string
  description = "Environment name"
}
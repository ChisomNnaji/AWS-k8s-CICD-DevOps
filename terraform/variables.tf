variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for EKS nodes"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of nodes"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of nodes"
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of nodes"
}

variable "ecr_repository_name" {
  type        = string
  description = "ECR repository name"
}

variable "log_retention_days" {
  type        = number
  description = "CloudWatch log retention in days"
}

variable "secrets_username" {
  type        = string
  description = "Username for the secret"
  default     = ""
}

variable "secrets_password" {
  type        = string
  description = "Password for the secret"
  default     = ""
}
variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs"
}

variable "cluster_security_group_id" {
  type        = string
  description = "Security group ID for the EKS cluster"
}

variable "node_security_group_id" {
  type        = string
  description = "Security group ID for the EKS nodes"
}

variable "cluster_role_arn" {
  type        = string
  description = "ARN of the EKS cluster IAM role"
}

variable "node_role_arn" {
  type        = string
  description = "ARN of the EKS node IAM role"
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

variable "environment" {
  type        = string
  description = "Environment name"
}
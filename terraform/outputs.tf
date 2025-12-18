# terraform/outputs.tf - Only include outputs that the root module needs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "node_group_name" {
  description = "Name of the EKS node group"
  value       = module.eks.node_group_name
}

output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = module.ecr.repository_url
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_name
}

output "security_group_ids" {
  description = "Security group IDs"
  value = {
    cluster = module.security_group.cluster_security_group_id
    node    = module.security_group.node_security_group_id
  }
}

output "iam_role_arns" {
  description = "IAM role ARNs"
  value = {
    cluster = module.iam.cluster_role_arn
    node    = module.iam.node_role_arn
  }
}

output "configure_kubectl" {
  description = "Command to configure kubectl"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.aws_region}"
}
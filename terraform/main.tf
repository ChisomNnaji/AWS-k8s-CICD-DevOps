module "vpc" {
  source = "./modules/vpc"

  name                 = "${var.project_name}-vpc"
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  cluster_name         = var.cluster_name
  environment          = var.environment
}

module "security_group" {
  source = "./modules/security_group"

  vpc_id       = module.vpc.vpc_id
  cluster_name = var.cluster_name
  environment  = var.environment
}

module "iam" {
  source = "./modules/iam"

  cluster_role_name = "${var.cluster_name}-cluster-role" # ADD THIS
  node_role_name    = "${var.cluster_name}-node-role"    # ADD THIS
  environment       = var.environment
}

# EKS Module - NO CHANGES NEEDED
module "eks" {
  source = "./modules/eks"

  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  vpc_id                    = module.vpc.vpc_id
  private_subnet_ids        = module.vpc.private_subnet_ids
  cluster_security_group_id = module.security_group.cluster_security_group_id
  node_security_group_id    = module.security_group.node_security_group_id
  cluster_role_arn          = module.iam.cluster_role_arn
  node_role_arn             = module.iam.node_role_arn
  node_instance_types       = var.node_instance_types
  node_desired_size         = var.node_desired_size
  node_min_size             = var.node_min_size
  node_max_size             = var.node_max_size
  environment               = var.environment
}

# ECR Module - NO CHANGES NEEDED
module "ecr" {
  source = "./modules/ecr"

  repository_name = var.ecr_repository_name
  environment     = var.environment
}

# S3 Module - NO CHANGES NEEDED
module "s3" {
  source = "./modules/s3"

  bucket_name = "${var.project_name}-artifacts-${var.environment}"
  environment = var.environment
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  log_group_name = "/aws/eks/${var.cluster_name}/cluster"
  retention_days = var.log_retention_days
  environment    = var.environment
}


module "secrets_manager" {
  source = "./modules/secrets_manager"

  secret_name = "${var.project_name}-secrets"
  username    = var.secrets_username
  password    = var.secrets_password
  environment = var.environment
}
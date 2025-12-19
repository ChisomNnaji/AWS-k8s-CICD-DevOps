# AWS EKS CI/CD DevOps Project

## Project Overview

This project demonstrates a complete **CI/CD pipeline** for deploying a containerized web application to **AWS EKS** using **Docker**, **Terraform**, and **GitHub Actions**. The pipeline automates the build, push, and deployment processes while following best practices in security and infrastructure management.


---

## What This Project Does

- Provisions AWS infrastructure using Terraform (modular setup)
- Builds and pushes Docker images to Amazon ECR
- Deploys applications to AWS EKS (Kubernetes)
- Automates deployments using GitHub Actions
- Exposes the application via AWS LoadBalancer
- Secures access using IAM and AWS Secrets

---

## Architecture (Textual Overview)

Developer pushes code to GitHub  
↓  
GitHub Actions pipeline runs  
↓  
Docker image is built and pushed to Amazon ECR  
↓  
Kubernetes pulls the image from ECR  
↓  
Application is deployed to AWS EKS  
↓  
Traffic reaches the app through a LoadBalancer  

---

## Tech Stack

**Cloud & Infrastructure**
- AWS (EKS, ECR, IAM, VPC, CloudWatch, S3, Secrets Manager)
- Terraform (Infrastructure as Code)

**Containers & Orchestration**
- Docker
- Kubernetes

**CI/CD**
- GitHub Actions

**Application**
- Nginx
- Static HTML

---

## Project Structure

```
app/        → Dockerfile and application files  
k8s/        → Kubernetes manifests  
terraform/  → Modular Terraform infrastructure  
README.md   → Project documentation  
```

---

## CI/CD Flow

1. Code is pushed to the `main` branch  
2. GitHub Actions pipeline starts  
3. AWS credentials are loaded from GitHub Secrets  
4. Docker image is built  
5. Image is pushed to Amazon ECR  
6. Kubernetes manifests are applied to EKS  
7. Rolling deployment updates pods  

---

## Security Decisions

- IAM roles instead of hardcoded credentials
- GitHub Secrets for sensitive values
- Controlled EKS access via aws-auth ConfigMap
- Terraform state excluded from Git

---

## How to Run This Project

### Infrastructure Setup

```
cd terraform
terraform init
terraform plan
terraform apply
```

### Application Build (Optional)

```
cd app
docker build -t my-app:1.0 .
docker tag my-app:1.0 <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/my-app:1.0
docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/my-app:1.0
```

### Kubernetes Deployment (Optional)

```
kubectl apply -f k8s/
kubectl rollout status deployment/my-app
```

---

## Expected Outcome

- Application running on AWS EKS
- Accessible via LoadBalancer URL
- CI/CD deploys automatically on every commit

---

## Author

**Chisom James Nnaji**  
LinkedIn: https://linkedin.com/in/chisom-nnaji-9a6304231  
GitHub: https://github.com/ChisomNnaji  

# AWS Kubernetes CI/CD Project

**Author:** Chisom Nnaji  
**LinkedIn:** [linkedin.com/in/chisom-nnaji-9a6304231](https://linkedin.com/in/chisom-nnaji-9a6304231)  
**Project Type:** AWS EKS, Kubernetes, Docker, GitHub Actions CI/CD  

---

## Project Overview

This project demonstrates a complete **CI/CD pipeline** for deploying a containerized web application to **AWS EKS** using **Docker**, **Terraform**, and **GitHub Actions**. The pipeline automates the build, push, and deployment processes while following best practices in security and infrastructure management.

---

## Architecture (Textual Diagram)

         
+--------------------+
     |  GitHub Repository |
     +---------+----------+
               |
               | Push to main branch
               v
     +--------------------+
     |  GitHub Actions    |
     |  CI/CD Workflow    |
     +---------+----------+
               |
               | Build & push Docker image
               v
     +--------------------+
     |  Amazon ECR        |
     +---------+----------+
               |
               | Pull Docker image
               v
     +--------------------+
     |  AWS EKS Cluster   |
     |  (Kubernetes)     |
     +---------+----------+
               |
    +----------+-----------+
    |                      |
+----------------+ +----------------+
| Deployment | | Service |
| (my-app) | | LoadBalancer |
+----------------+ +----------------+
|
+----------------+
| Ingress |
| (optional) |
+----------------+

---

## Tools & Services Used

- **AWS Services:** EKS, ECR, IAM, VPC, Security Groups, S3, Secrets Manager, CloudWatch  
- **Infrastructure as Code:** Terraform  
- **Containerization:** Docker  
- **CI/CD:** GitHub Actions  
- **Kubernetes Objects:** Deployment, Service, Ingress  

---

## CI/CD Flow

1. **Code Commit:** Push changes to the `main` branch on GitHub.  
2. **GitHub Actions:** Trigger workflow to build Docker image.  
3. **ECR Push:** Docker image is pushed to Amazon ECR repository.  
4. **EKS Deployment:** Workflow updates Kubernetes manifests and applies them to the EKS cluster.  
5. **Verification:** Deployment rollout is monitored; any failures are flagged in GitHub Actions.  

---

## Security Decisions

- **IAM Roles:** Separate roles for EKS nodes and GitHub Actions with least privilege.  
- **Secrets Management:** AWS Secrets Manager for sensitive information (EKS cluster name, AWS credentials).  
- **ECR Authentication:** GitHub Actions logs into ECR using IAM credentials.  

---

## How to Reproduce

1. **Clone the repository:**
```bash
git clone https://github.com/ChisomNnaji/AWS-k8s-CICD-DevOps.git
cd AWS-k8s-CICD-DevOps

2. Terraform Deployment:

cd terraform
terraform init
terraform plan
terraform apply

3. Build and Push Docker Image (Optional if using CI/CD):

cd ../app
docker build -t my-app:1.0 .
docker tag my-app:1.0 <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/my-app:1.0
docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/my-app:1.0


4. Kubernetes Deployment (Optional if using CI/CD):

kubectl apply -f ../k8s/
kubectl rollout status deployment/my-app

Expected Outcome

A running web application accessible via the LoadBalancer URL.

Application displays custom HTML page confirming CI/CD deployment.

Full automation of future commits via GitHub Actions.

Contact & Portfolio

Chisom Nnaji
LinkedIn: linkedin.com/in/chisom-nnaji-9a6304231
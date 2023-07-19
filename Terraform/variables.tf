variable "aws_region" {
  description = "The AWS region where the EKS cluster will be created"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  default     = "us-east-1a"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "eks_role_name" {
  description = "The name of the IAM role for EKS"
  default     = "my-eks-role"
}

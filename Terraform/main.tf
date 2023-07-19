# Provider configuration for AWS
provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Create subnets
resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
}

# Create a security group
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EKS cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.my_role.arn
  vpc_config {
    subnet_ids         = [aws_subnet.subnet_a.id]
    security_group_ids = [aws_security_group.my_sg.id]
  }
}

# Create an IAM role for EKS
resource "aws_iam_role" "my_role" {
  name               = var.eks_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach the necessary policies to the IAM role
resource "aws_iam_role_policy_attachment" "my_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.my_role.name
}

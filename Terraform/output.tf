output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.subnet_a.id
}

output "security_group_id" {
  value = aws_security_group.my_sg.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "eks_cluster_name" {
  value = aws_eks_cluster.my_cluster.name
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.my_cluster.arn
}

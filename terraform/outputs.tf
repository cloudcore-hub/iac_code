output "cluster_name" {
    description = "AWS EKS Cluster Name"
    value = module.eks.cluster_name
}

output "cluster_endpoint" {
    description = "Endpoint for AWS EKS"
    value = module.eks.cluster_endpoint
}

output "region" {
    description = "AWS EKS Cluster region"
    value = var.region
}

output "cluster_security_group_id" {
    description = "Security group ID for AWS EKS Cluster"
    value = module.eks.cluster_security_group_id
}
output "jumphost_public_ip" {
  description = "Public IP address of the EC2 jumphost"
  value       = aws_instance.jumphost.public_ip
}
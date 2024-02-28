output "region" {
    description = "Jumphost Server region"
    value = var.region
}
output "jumphost_public_ip" {
  description = "Public IP address of the EC2 jumphost"
  value       = aws_instance.ec2.public_ip
}
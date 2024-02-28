variable "region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type = string
  default = "quizapp-eks"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c7217cdde317cfec" // Replace with the latest AMI ID for your region
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.large"
}

variable "instance_keypair" {
  description = "EC2 keypair"
  type        = string
  default     = "gitopskey"
}

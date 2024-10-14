# variables.tf

variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  default     = "t2.micro"  # Free-tier eligible instance type
}

variable "key_name" {
  description = "Name of the key pair to use for the EC2 instance."
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  default     = "ami-08c40ec9ead489470"  # Amazon Linux 2 AMI (Free-tier eligible)
}

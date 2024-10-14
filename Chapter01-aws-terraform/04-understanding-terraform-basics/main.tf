# main.tf

provider "aws" {
  region = var.aws_region
}

# Create a security group for the EC2 instance
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "allow_ssh_http_sg"
  }
}

# Create an EC2 instance with Docker installed
resource "aws_instance" "ec2_with_docker" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  # Install Docker using user data
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras enable docker
              sudo yum install -y docker
              sudo service docker start
              sudo usermod -aG docker ec2-user
              EOF

  tags = {
    Name = "Docker-EC2-Instance"
  }

  # Output the instance's public IP
  associate_public_ip_address = true
}

# Output the public IP address and instance details
output "instance_public_ip" {
  description = "Public IP of the EC2 instance with Docker"
  value       = aws_instance.ec2_with_docker.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_with_docker.id
}

output "instance_ami" {
  description = "AMI used for the EC2 instance"
  value       = aws_instance.ec2_with_docker.ami
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Change this to your AWS region
}

# Security group to allow SSH and HTTP
resource "aws_security_group" "terraform_sg" {
  name        = "terraform-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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

# EC2 instance
resource "aws_instance" "terraform_ec2" {
  ami           = "ami-0c50b6f7dc3701ddd" # Example Amazon Linux 2 AMI in ap-south-1
  instance_type = "t2.micro"
  key_name      = "your-keypair-name"     # Replace with your AWS key pair name

  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}

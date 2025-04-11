terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a Ec2 instance
resource "aws_instance" "myinstance1" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Dev"
  }

}

# Create S3 bucket
resource "aws_s3_bucket" "bucket1" {
  bucket = "vaniterraform1"

}

output "instance_public_ip" {
  value = aws_instance.myinstance1.public_ip
}

output "bucket_name" {
  value = aws_s3_bucket.bucket1.bucket
}



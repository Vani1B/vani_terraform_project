terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

variable "my_ami" {
  description = "This to define my ami"
  default     = "ami-0c02fb55956c7d316"

}

variable "my_instance_type" {
  description = "This to define my instance type"
  default     = "t2.micro"

}

resource "aws_instance" "myinstance1" {
  ami           = var.my_ami
  instance_type = var.my_instance_type
  tags = {
    "Name" = "Dev"
  }

}

output "private_ip" {
  value = aws_instance.myinstance1.private_ip
}

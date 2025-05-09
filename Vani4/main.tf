terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "my_ami" {
  description = "This to define my ami"
  default     = "ami-0c02fb55956c7d316"

}

variable "my_instance_type" {
  description = "This to define my ami"
  default     = "t2.micro"
}


resource "aws_instance" "myinstance1" {
  ami           = var.my_ami
  instance_type = var.my_instance_type
  tags = {
    "Name" = "Dev3"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.myinstance1.private_ip} >> private_ips.txt"

  }
}
output "name" {
  value = aws_instance.myinstance1.private_ip
}
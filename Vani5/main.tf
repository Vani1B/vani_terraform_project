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
  ami                    = var.my_ami
  instance_type          = var.my_instance_type
  key_name               = "terraformkey"
  vpc_security_group_ids = ["sg-005cc94d57f5a0e2b"]
  tags = {
    "Name" = "Dev5"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraformkey.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras enable nginx1",
      "sudo yum clean metadata",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
        
      
  }
}
output "name" {
  value = aws_instance.myinstance1.private_ip
}
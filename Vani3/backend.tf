terraform {
  backend "s3" {
    bucket = "vaniterraform1"
    key    = "Vani3/terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "EC2instance" {
  ami = "ami-04f9aa2b7c7091927"
  instance_type =  "t3.micro"
}
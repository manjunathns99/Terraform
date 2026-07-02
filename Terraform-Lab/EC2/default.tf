provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "EC2instance" {
  ami = "ami-0ffa797f35095b9f7"
  instance_type =  "t3.micro"
}
provider "aws" {
    region = "us-west-2"
    access_key = ""
    secret_key = ""


}

resource "aws_instance" "Intel_VPC" {
 cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My-Intel_VPC"
  }
}
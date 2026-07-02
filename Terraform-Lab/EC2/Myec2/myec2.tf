provider "aws" {
  region = "ap-south-2"
}


resource "aws_security_group" "webtrafic" {
  name = "allow https"
# Inbound Rule
    ingress  {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
# Outbond rule
    egress  {
        from_port = 0
        to_port =  0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Terraform-security-group"
    }
}

resource "aws_instance" "myinstance" {
    ami = "ami-0ffa797f35095b9f7"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.webtrafic.id]
    tags = {
        Name = "Terraform-ec2"
    }
}
provider "aws" {
      region = "ap-south1"
}

resource "aws_s3_bucket" "demo-s3"{
      bucket = "terraform-new"
}

resource "aws_instance" "demoec2"{
      ami = "ami-02bb7d8191b50f4bb"
      instance_type = "t2.micro"
      tags={
            Name = "terra-instance"
      }
      
}

resources "aws_key_pair" "mykey"{
      key_name = "terra-key"
      public_key = file ("path")
}

resource "aws_default_vpc" "default_vpc"{
}

resource "aws_instance" "my-vpc-instance"{
      key_name = aws_key_pair.mykey.key_name
}


resource "aws_security_group" "allow_ssh"{
      name = "allow_ssh"
      description = "Allow ssh inbound traffic"
      vpc_id = aws_default_vpc.default_vpc.id

ingress{
      description = "TLS from VPC"
      from_port = 22 
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
}
tags={
      Name = "allow_ssh"
      }
}



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

provider "aws" {
      region = "ap-south1"
}

resource "aws+s3_bucket" "demo-s3"{
    bucket = "terraform-new"
}

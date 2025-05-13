terraform {
  backend "s3" {
    bucket         = "minhaj-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "demo" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "CI/CD Test Bucket"
    Environment = "Dev"
  }
}
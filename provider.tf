# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
terraform {
backend "s3" {
bucket = "terracostate"
key = "jj-ort"
region = "eu-west-1"
}
}

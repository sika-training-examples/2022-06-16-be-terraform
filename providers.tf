terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.1"
    }
  }
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

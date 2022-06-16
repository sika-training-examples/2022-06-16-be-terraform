terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
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

resource "aws_key_pair" "default" {
  key_name   = "ondrejsika"
  public_key = file("./ssh-keys/ondrejsika.pub")
}

data "aws_ami" "debian11" {
  most_recent = true
  name_regex  = "^debian-11-amd64-*"
  owners      = ["aws-marketplace"]
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "debian11-ami" {
  value = data.aws_ami.debian11.id
}

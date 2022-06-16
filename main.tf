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

resource "aws_security_group" "allow-all" {
  name = "allow-all-ondrejsika"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.debian11.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.default.key_name
  security_groups = [
    aws_security_group.allow-all.name,
  ]
}

output "ip" {
  value = aws_instance.example.public_ip
}

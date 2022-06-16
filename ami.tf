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

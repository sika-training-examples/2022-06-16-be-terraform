resource "aws_instance" "example" {
  # ami           = data.aws_ami.debian11.id
  ami           = local.DEBIAN11
  instance_type = "t3.micro"
  key_name      = aws_key_pair.default.key_name
  security_groups = [
    aws_security_group.allow-all.name,
  ]
}

output "ip" {
  value = aws_instance.example.public_ip
}

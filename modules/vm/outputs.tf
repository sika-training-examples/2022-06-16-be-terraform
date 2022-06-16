output "public_ip" {
  value = aws_instance.this.public_ip
}

output "admin-password" {
  value     = local.password
  sensitive = true
}

output "aws_instance" {
  value = aws_instance.this
}

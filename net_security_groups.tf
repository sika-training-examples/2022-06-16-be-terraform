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

locals {
  DEFAULT_SECURITY_GROUPS = [
    aws_security_group.allow-all.name,
  ]
}

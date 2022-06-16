locals {
  DEBIAN11 = "ami-0a8d4f587782c4a30"
}

resource "random_password" "admin-password" {
  count            = var.password == null ? 1 : 0
  length           = 16
  special          = true
  override_special = "_"
}

locals {
  password = var.password == null ? random_password.admin-password[0].result : var.password
}

resource "aws_instance" "this" {
  ami             = local.DEBIAN11
  instance_type   = "t3.micro"
  security_groups = var.security_groups
  user_data       = <<EOF
#cloud-config
ssh_pwauth: yes
password: ${local.password}
chpasswd:
  expire: false
runcmd:
  - |
    apt update
    apt install -y curl sudo git
    curl -fsSL https://ins.oxs.cz/slu-linux-amd64.sh | sudo sh
EOF
}

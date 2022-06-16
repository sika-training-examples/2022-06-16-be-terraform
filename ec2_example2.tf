resource "random_password" "example2-password" {
  length           = 16
  special          = true
  override_special = "_"
}

resource "aws_instance" "example2" {
  # ami           = data.aws_ami.debian11.id
  ami           = local.DEBIAN11
  instance_type = "t3.micro"
  security_groups = [
    aws_security_group.allow-all.name,
  ]
  user_data = <<EOF
#cloud-config
ssh_pwauth: yes
password: ${random_password.example2-password.result}
chpasswd:
  expire: false
write_files:
- path: /html/index.html
  permissions: "0755"
  owner: root:root
  content: |
    <h1>Hello from Cloud Init
runcmd:
  - |
    apt update
    apt install -y curl sudo git nginx
    curl -fsSL https://ins.oxs.cz/slu-linux-amd64.sh | sudo sh
    cp /html/index.html /var/www/html/index.html
EOF
  provisioner "local-exec" {
    command = "slu wf tcp -a ${self.public_ip}:80 && curl -s ${self.public_ip}"
  }
}

output "password2" {
  value     = random_password.example2-password.result
  sensitive = true
}

output "ip2" {
  value = aws_instance.example2.public_ip
}

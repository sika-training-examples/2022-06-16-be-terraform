# data "aws_ami" "debian11" {
#   most_recent = true
#   name_regex  = "^debian-11-amd64-*"
#   owners      = ["aws-marketplace"]
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

locals {
  DEBIAN11 = "ami-0a8d4f587782c4a30"
}

output "debian11-ami" {
  value = local.DEBIAN11
}

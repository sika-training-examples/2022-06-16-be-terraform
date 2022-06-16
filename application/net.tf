locals {
  AVAILABILITY_ZONE_A = "eu-central-1a"
  AVAILABILITY_ZONE_B = "eu-central-1b"
  AVAILABILITY_ZONE_C = "eu-central-1c"
}

module "net--default" {
  source     = "../modules/net"
  name       = var.name
  cidr_block = "10.0.0.0/16"
  subnets = {
    "10.0.1.0/24" = local.AVAILABILITY_ZONE_A
    "10.0.2.0/24" = local.AVAILABILITY_ZONE_B
  }
}

locals {
  availability_zone_a = "eu-central-1a"
  availability_zone_b = "eu-central-1b"
  availability_zone_c = "eu-central-1c"
}

module "net--default" {
  source     = "./modules/net"
  name       = "default-ondrejsika"
  cidr_block = "10.0.0.0/16"
  subnets = {
    "10.0.1.0/24" = local.availability_zone_a
    "10.0.2.0/24" = local.availability_zone_b
    "10.0.3.0/24" = local.availability_zone_c
  }
}

resource "aws_subnet" "extra" {
  for_each = {
    "22" = {
      "az" : local.availability_zone_b
    }
    "23" = {
      "az" : local.availability_zone_a
    }
    "24" = {
      "az" : local.availability_zone_c
    }
  }

  vpc_id            = module.net--default.vpc_id
  cidr_block        = "10.0.${each.key}.0/24"
  availability_zone = each.value.az
}

module "net--foo" {
  source     = "./modules/net"
  name       = "foo"
  cidr_block = "10.0.0.0/16"
  subnets = {
    "10.0.1.0/24" = local.availability_zone_a
    "10.0.2.0/24" = local.availability_zone_b
  }
}

module "net--bar" {
  source     = "./modules/net"
  name       = "bar"
  cidr_block = "10.0.0.0/16"
  subnets = {
    "10.0.1.0/24" = local.availability_zone_a
    "10.0.2.0/24" = local.availability_zone_b
  }
}

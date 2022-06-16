resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "default-ondrejsika"
  }
}

locals {
  availability_zone_a = "eu-central-1a"
  availability_zone_b = "eu-central-1b"
  availability_zone_c = "eu-central-1c"
  availability_zones = [
    local.availability_zone_a,
    local.availability_zone_b,
    local.availability_zone_c,
  ]
}

resource "aws_subnet" "default" {
  count             = 3
  vpc_id            = aws_vpc.default.id
  availability_zone = local.availability_zones[count.index]
  cidr_block        = "10.0.${count.index + 1}.0/24"
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

  vpc_id            = aws_vpc.default.id
  availability_zone = each.value.az
  cidr_block        = "10.0.${each.key}.0/24"
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

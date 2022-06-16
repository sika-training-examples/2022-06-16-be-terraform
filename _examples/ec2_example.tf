module "vm--example" {
  source          = "./modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
}

module "vm--foo" {
  source          = "./modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  subnet_id       = module.net--foo.subnet_ids[0]
}

module "vm--bar" {
  source          = "./modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  subnet_id       = module.net--bar.subnet_ids[0]
}

module "vm--baz" {
  source          = "./modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  password        = "asdfasdf2022"
  key_name        = aws_key_pair.default.key_name
}

output "ec2" {
  sensitive = true
  value = {
    example = {
      ip       = module.vm--example.public_ip
      password = module.vm--example.admin-password
    }
    foo = {
      ip       = module.vm--foo.public_ip
      password = module.vm--foo.admin-password
    }
    bar = {
      ip       = module.vm--bar.public_ip
      password = module.vm--bar.admin-password
    }
    baz = {
      ip       = module.vm--baz.public_ip
      password = module.vm--baz.admin-password
    }
  }
}

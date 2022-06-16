module "vm--db" {
  source          = "../modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  subnet_id       = module.net--default.subnet_ids[0]
}

module "vm--web" {
  source          = "../modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  subnet_id       = module.net--default.subnet_ids[1]
}

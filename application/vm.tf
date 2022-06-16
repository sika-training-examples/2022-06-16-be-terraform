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

module "vm--worker" {
  source          = "../modules/vm"
  security_groups = local.DEFAULT_SECURITY_GROUPS
  subnet_id       = module.net--default.subnet_ids[1]
  depends_on = [
    module.vm--db,
  ]
}

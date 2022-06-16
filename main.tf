module "application--dev" {
  source = "./application"
  name   = "dev"
}

output "dev--ips" {
  value = module.application--dev.ips
}


output "dev--admin-passwords" {
  value     = module.application--dev.admin-passwords
  sensitive = true
}

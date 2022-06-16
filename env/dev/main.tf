module "application" {
  source = "../../application"
  name   = "dev"
}

output "ips" {
  value = module.application.ips
}

output "admin-passwords" {
  value     = module.application.admin-passwords
  sensitive = true
}

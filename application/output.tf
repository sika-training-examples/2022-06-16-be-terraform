output "ips" {
  value = {
    db  = module.vm--db.public_ip
    web = module.vm--web.public_ip
  }
}

output "admin-passwords" {
  value = {
    db  = module.vm--db.admin-password
    web = module.vm--web.admin-password
  }
  sensitive = true
}

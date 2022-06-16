variable "password" {
  type    = string
  default = null
}

variable "key_name" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "security_groups" {
  type = list(string)
}

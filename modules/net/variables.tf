variable "name" {
  type        = string
  description = "Name (tag) of VPC"
}

variable "cidr_block" {
  type = string
}

variable "subnets" {
  type        = map(string)
  description = "{ subnet cidr = availability_zone }"
}

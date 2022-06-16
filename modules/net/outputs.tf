output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = [
    for subnet in aws_subnet.this :
    subnet.id
  ]
}

output "aws_vpc" {
  value = aws_vpc.this
}


output "aws_subnet" {
  value = aws_subnet.this
}

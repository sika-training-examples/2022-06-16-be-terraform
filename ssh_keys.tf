resource "aws_key_pair" "default" {
  key_name   = "ondrejsika"
  public_key = file("./ssh-keys/ondrejsika.pub")
}

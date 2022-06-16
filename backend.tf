terraform {
  backend "s3" {
    bucket = "tf-ba"
    key    = "terraform-state/ondrejsika.tfstate"
    region = "eu-central-1"
  }
}

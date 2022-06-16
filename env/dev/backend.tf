terraform {
  backend "s3" {
    bucket = "tf-ba"
    key    = "terraform-state/ondrejsika-dev.tfstate"
    region = "eu-central-1"
  }
}

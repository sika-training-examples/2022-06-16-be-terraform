terraform {
  backend "s3" {
    bucket = "tf-ba"
    key    = "terraform-state/ondrejsika-prod.tfstate"
    region = "eu-central-1"
  }
}

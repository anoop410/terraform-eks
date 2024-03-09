terraform {
  backend "s3" {
    bucket = "terraform-state-anoop"
    key    = "eks/terraform.tfstate"
    region = "ap-south-2"
  }
}

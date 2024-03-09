terraform {
  backend "s3" {
    bucket = "terraform-state-anoop"
    key    = "jenkins/terraform.tfstate"
    region = "ap-south-2"
  }
}

data "aws_ami" "free_tier_amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# data for availablity zone
data "aws_availability_zones" "azs" {
  state = "available"
}
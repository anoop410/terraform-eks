
# data for availablity zone
data "aws_availability_zones" "azs" {
  state = "available"
}
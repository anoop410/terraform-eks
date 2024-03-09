variable "vpc_cidr" {
  description = "vpc_cidr"
  type        = string
}

variable "public_subnets" {
  description = "public subnet subnet cidr"
  type        = list(string)
}
variable "private_subnets" {
  description = "private subnet cidr"
  type        = list(string)
}
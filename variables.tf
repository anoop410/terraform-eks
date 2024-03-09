variable "vpc_cidr" {
  description = "vpc_cidr"
  type        = string
}

variable "public_subnets" {
  description = "subnet cidr"
  type        = list(string)
}
variable "instance_type" {
  description = "ec2 instance type"
  type = string
}
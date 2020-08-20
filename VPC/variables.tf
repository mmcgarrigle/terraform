variable "cidr_block" {
  default = "192.167.0.0/16"
}

variable "subnet_cidr_block" {
  default = "192.167.1.0/24"
}

variable "Internet" {
  default = "0.0.0.0/0"
}

variable "vpc_id" {
  default = "aws_vpc.terraform_vpc.id"
}

variable "TFGW" {
  default = "aws_internet_gateway.TFGW.id"
}

variable "subnet_id" {
  default = "aws_subnet.terraform_subnet_a.id"
}

variable "TFRT" {
  default = "aws_route_table.TFRT.id"
}
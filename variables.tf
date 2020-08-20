variable "region" {
  description = "This variable states the default region for new EC2 instances"
  default     = "eu-west-1"
}


variable "credentials" {
  description = "This variable states the location of the active credentials file"
  default     = "~/.aws/credentials"
}

variable "vpc_id" {
  default = "aws_vpc.terraform_vpc.id"
}

variable "TFGW" {
  default = "aws_internet_gateway.TFGW.id"
}

variable "Internet" {
  default = "0.0.0.0/0"
}

variable "subnet_id" {
  default = "aws_subnet.terraform_subnet_a.id"
}
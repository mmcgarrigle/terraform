variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami" {
  description = "This variable states which ami to use for new EC2 instances"
  default     = "ami-07ee42ba0209b6d77"
}

variable "region" {
  description = "This variable states the default region for new EC2 instances"
  default     = "eu-west-1"
}

variable "key" {
  description = "This variable states the key pair used for all new EC2 instances"
  default     = "mmcga"
}

variable "credentials" {
  description = "This variable states the location of the active credentials file"
  default     = "~/.aws/credentials"
}

variable "cidr_block" {
  default = "192.167.0.0/16"
}

variable "subnet_cidr_block" {
  default = "192.167.1.0/24"
}

variable "ingress_ports" {
  type        = list
  description = "list of ingress ports"
  default     = [22]
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
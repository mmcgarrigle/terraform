variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.micro"
}

variable "ami" {
  description = "This variable states which ami to use for new EC2 instances"
  default     = "ami-07ee42ba0209b6d77"
}

variable "key" {
  description = "This variable states the key pair used for all new EC2 instances"
  default     = "mmcga"
}

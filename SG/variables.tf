variable "vpc_id" {
  default = "aws_vpc.terraform_vpc.id"
}

variable "ingress_ports" {
  type        = list
  description = "list of ingress ports"
  default     = [22]
}

variable "Internet" {
  default = "0.0.0.0/0"
}


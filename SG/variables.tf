variable "vpc_id" {
  description = "vpc_id for SG"
}

variable "ingress_ports" {
  type        = list
  description = "list of ingress ports"
  default     = [22]
}

variable "Internet" {
  default = "0.0.0.0/0"
}


resource "aws_security_group" "Allow_SSH" {
  name        = "Allow_SSH"
  description = "Allows ability to SSH into EC2 instance"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.Internet]
    }
  }

  egress {
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
    cidr_blocks = [var.Internet]
  }

  tags = {
    Name = "Allow_SSH"
  }
}
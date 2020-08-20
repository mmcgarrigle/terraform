resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.instance
  key_name                    = var.key
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_id

  tags = {
    Name = "TFEC2"
  }
}
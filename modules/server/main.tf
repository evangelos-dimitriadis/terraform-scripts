resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.size
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups
  tags = {
    "Name"        = "Server from Module"
    "Environment" = "Training"
  }
}

resource "aws_ec2_instance_state" "web" {
  instance_id = aws_instance.web.id
  state       = "stopped"
}

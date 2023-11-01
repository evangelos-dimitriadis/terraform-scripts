variable "ami" {}
variable "size" {
  default = "t3.micro"
}
variable "subnet_id" {}
variable "user" {}

variable "security_groups" {
  type = list(any)
}
variable "key_name" {
}
variable "private_key" {
}
variable "tags" {
}


resource "aws_instance" "web" {
  ami                         = var.ami
  instance_type               = var.size
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  key_name                    = var.key_name
  connection {
    user        = var.user
    private_key = var.private_key
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo rm -rf /tmp",
      "sudo git clone https://github.com/hashicorp/demo-terraform-101 /tmp",
      "sudo sh /tmp/assets/setup-web.sh",
    ]
  }
  tags = var.tags
}

resource "aws_ec2_instance_state" "web" {
  instance_id = aws_instance.web.id
  state       = "stopped"
}

output "public_ip" {
  value = aws_instance.web.public_ip
}
output "public_dns" {
  value = aws_instance.web.public_dns
}

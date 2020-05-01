variable "servers" {
  type = list
}

resource "aws_instance" "ec2" {
  ami                         = "ami-0fc61db8544a617ed"
  instance_type               = "t2.micro"
  count                       = "${length(var.servers)}"
  associate_public_ip_address = true
  tags = {
    Name = "${var.servers[count.index]}"
  }
}

output "public_ip" {
  value = ["${aws_instance.ec2.*.public_ip}"]
}
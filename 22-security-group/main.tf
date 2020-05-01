variable "EC2_AMI" {
    type = string
    default = "ami-0fc61db8544a617ed"
}

resource "aws_instance" "myec2" {
  ami = "${var.EC2_AMI}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web_traffic.name}"]

  tags = {
    Name = "22 - Security Group - EC2"
  }
}


resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

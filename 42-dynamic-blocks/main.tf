variable "EC2_AMI" {
  type    = string
  default = "ami-0fc61db8544a617ed"
}

variable "ingress_rules" {
  type    = list(number)
  default = [80, 443]
}

variable "egress_rules" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_instance" "myec2" {
  ami             = var.EC2_AMI
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]

  tags = {
    Name = "22 - Security Group - EC2"
  }
}


resource "aws_security_group" "web_traffic" {
  name = "Allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

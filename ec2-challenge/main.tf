variable "EC2_AMI" {
    type = string
    default = "ami-0fc61db8544a617ed"
}

resource "aws_instance" "Database" {
  ami = "${var.EC2_AMI}"
  instance_type = "t2.micro"

  tags = {
    Name = "Database"
  }
}

resource "aws_instance" "Web" {
  ami = "${var.EC2_AMI}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.web_security_group.name}"]
  user_data = "${file("server-script.sh")}"

  tags = {
    Name = "Web"
  }
}


resource "aws_security_group" "web_security_group" {
  name = "Web security group"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

resource "aws_eip" "web_ip" {
  instance = "${aws_instance.Web.id}"
}

output "web_public_ip" {
  value = "${aws_eip.web_ip.public_ip}"
}

output "db_private_ip" {
  value = "${aws_instance.Database.private_ip}"
}

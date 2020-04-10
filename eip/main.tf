variable "EC2_AMI" {
    type = string
    default = "ami-0fc61db8544a617ed"
}

resource "aws_instance" "ec2" {
  ami = "${var.EC2_AMI}"
  instance_type = "t2.micro"

  tags = {
    Name = "Public IP"
  }
}

resource "aws_eip" "elastic_ip" {
  instance = "${aws_instance.ec2.id}"
}

output "public_ip" {
  value = "${aws_eip.elastic_ip.public_ip}"
}
variable "EC2_AMI" {
    type = string
    default = "ami-0fc61db8544a617ed"
}

resource "aws_instance" "myec2" {
  ami = var.EC2_AMI"
  instance_type = "t2.micro"
}

variable "EC2_AMI" {
    type = string
    default = "ami-0fc61db8544a617ed"
}

variable "ec2Name" {
    type = string
}


resource "aws_instance" "moduleEC2" {
  ami = var.EC2_AMI
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2Name
  }
}

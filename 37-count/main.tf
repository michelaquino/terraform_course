resource "aws_instance" "ec2" {
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"

  count = 3
}

resource "aws_instance" "Web" {
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_security_group.name]
  user_data = file("./web/server-script.sh") // relative to root folder

  tags = {
    Name = "Web"
  }
}

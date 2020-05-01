
resource "aws_instance" "Database" {
  ami = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"

  tags = {
    Name = "Database"
  }
}

output "db_private_ip" {
  value = "${aws_instance.Database.private_ip}"
}

resource "aws_eip" "web_ip" {
  instance = "${aws_instance.Web.id}"
}

output "web_public_ip" {
  value = "${aws_eip.web_ip.public_ip}"
}

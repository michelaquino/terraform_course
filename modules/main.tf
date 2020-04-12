resource "aws_iam_user" "mainUser" {
    name = "MainUser"
}

module "ec2Module" {
    source = "./ec2"

    ec2Name = "My First Module"
}
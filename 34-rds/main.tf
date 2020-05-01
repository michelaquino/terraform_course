resource "aws_db_instance" "myRDS" {
  name = "mydb"
  identifier = "my-first-rds"

  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.2.21"
  username = "admin"
  password = "password123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true // important do destroy and delete snapshot (not in production)
}
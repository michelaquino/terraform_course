module "DatabaseServer" {
  source = "./db"
}

module "WebServer" {
  source = "./web"
}

terraform {
    backend "s3" {
        bucket = "michel-terraform-course-01-05-2020"
        key = "terraform/tfstate.tfstate"
        region = "us-east-1"

        access_key = "key"
        secret_key = "secret"
    }
}

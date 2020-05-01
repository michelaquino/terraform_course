resource "aws_s3_bucket" "s3remotestate" {
    bucket = "michel-terraform-course-01-05-2020"
    force_destroy = true

    versioning {
        enabled    = true
    }
}
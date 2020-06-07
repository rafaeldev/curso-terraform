resource "random_id" "bucket" {
  byte_length = 8
}

resource "random_id" "bucket_2" {
  byte_length = 4
}

module "bucket" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket.hex}"
  versioning = true

  tags = {
    "Name" = "Bucket maneiro"
  }

  create_object = true
  object_key = "files/${random_id.bucket.dec}"
  object_source = "./file.txt"
}

module "bucket_2" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket_2.hex}"
}

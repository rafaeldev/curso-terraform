resource "random_id" "bucket" {
  byte_length = 8
}

resource "random_id" "bucket_2" {
  byte_length = 4
}

module "bucket" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket.hex}"

module "bucket_2" {
  source = "./s3"

  name = "my-bucket-${random_id.bucket_2.hex}"
}

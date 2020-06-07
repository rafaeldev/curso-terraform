resource "aws_s3_bucket" "this" {
  bucket = "${var.name}"
  acl = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

resource "aws_s3_bucket_object" "object" {
  count = "${var.create_object ? 1 : 0}"

  bucket = "${aws_s3_bucket.this.id}"
  key    = "${var.object_key}"
  source    = "${var.object_source}"
  etag   = "${filemd5(var.object_source)}"
}

#-------------------------------
# S3
#-------------------------------
resource "aws_s3_bucket" "csv" {
  bucket        = "${var.pj_name}-s3-${var.env}"
  acl           = "private"
  force_destroy = true                               #dev環境なので強制削除OK
}

#-------------------------------
# インターネットゲートウェイ
#-------------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.pj_name}"
    Environment = "${var.env}"
  }
}

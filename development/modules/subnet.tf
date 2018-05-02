#-------------------------------
# サブネット
#-------------------------------

resource "aws_subnet" "sn_a" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.sn_a_cidr_block}"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags {
    Name        = "${var.pj_name}_a"
    Environment = "${var.env}"
  }
}

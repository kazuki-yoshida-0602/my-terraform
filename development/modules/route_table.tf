#-------------------------------
# ルートテーブル
#-------------------------------

resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name        = "${var.pj_name}"
    Environment = "${var.env}"
  }
}

resource "aws_route_table_association" "rta_a" {
  subnet_id      = "${aws_subnet.sn_a.id}"
  route_table_id = "${aws_route_table.rt.id}"
}

#-------------------------------
# セキュリティグループ
#-------------------------------

resource "aws_security_group" "ec2_app" {
  name   = "${var.pj_name}_ec2_sg"
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.env}_ec2_sg"
    Environment = "${var.env}"
  }

  # ssh(22) インバウンド
  # (ラボ本社、ビルドサーバのみ許可)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.179.90.192/28", "54.249.47.122/32"]
  }

  # http(80) インバウンド
  # (ラボ本社)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["203.179.90.192/28"]
  }

  # アウトバウンドは全許可
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

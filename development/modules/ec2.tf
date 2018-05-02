#-------------------------------
# EC2
#-------------------------------

resource "aws_instance" "app" {
  ami                    = "${var.app_ami}"
  availability_zone      = "ap-northeast-1a"
  instance_type          = "${var.app_instance_type}"
  key_name               = "${var.key_pair}"
  vpc_security_group_ids = ["${aws_security_group.ec2_app.id}"]
  subnet_id              = "${aws_subnet.sn_a.id}"
  monitoring             = false
  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.id}"

  #	associate_public_ip_address = true   #public_ip関連付け
  #	ebs_optimized               = false  #ebs最適化

  root_block_device = {
    volume_type = "${var.app_root_block_volume_type}"
    volume_size = "${var.app_root_block_volume_size}"
  }
  tags {
    Name        = "${var.pj_name}"
    DisplayName = "${var.app_display_name}"
    Environment = "${var.env}"
  }
}

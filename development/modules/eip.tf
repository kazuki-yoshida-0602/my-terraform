#-------------------------------
# Elastic IP
#-------------------------------

resource "aws_eip" "app" {
  instance = "${aws_instance.app.id}"
  vpc      = true

  tags {
    Name        = "${var.pj_name}"
    Environment = "${var.env}"
  }
}

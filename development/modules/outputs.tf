output "server-ip" {
  value = "${aws_eip.app.public_ip}"
}

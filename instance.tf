resource "aws_instance" "testinstance" {
  ami           = "${var.instance["ami_id"]}"
  instance_type = "${var.instance["type"]}"
  subnet_id     = "${var.instance["subnet_id"]}"

  vpc_security_group_ids = [
    "${aws_security_group.testinstance.id}"
  ]

  monitoring = true

  tags {
    Name       = "${var.atlas["org"]}/${var.atlas["env"]}/testinstance"
    ChargeCode = "${var.atlas["charge_code"]}"
  }
  iam_instance_profile = "${var.instance["iam_role"]}"
  key_name = "${var.aws["key_pair_name"]}"
}

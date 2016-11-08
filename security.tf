resource "aws_security_group" "testinstance" {
  name        = "${var.atlas["org"]}/${var.atlas["env"]}/testinstance"
  description = "Managed by Terraform"
  vpc_id      = "${var.instance["vpc_id"]}"

  tags {
    ChargeCode = "${var.atlas["charge_code"]}"
  }
}

resource "aws_security_group_rule" "testinstance_to_outside" {
  type      = "egress"
  from_port = 0
  to_port   = 65000
  protocol  = "tcp"

  cidr_blocks = [
    "0.0.0.0/0",
  ]

  security_group_id = "${aws_security_group.testinstance.id}"
}

resource "aws_security_group_rule" "testinstance_ingress_ssh" {
  security_group_id = "${aws_security_group.testinstance.id}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  cidr_blocks = [
    "${var.instance["cidr"]}",
  ]
}

resource "aws_security_group_rule" "testinstance_ingress_https" {
  security_group_id = "${aws_security_group.testinstance.id}"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  cidr_blocks = [
    "${var.instance["cidr"]}",
  ]
}

resource "aws_security_group_rule" "testinstance_ingress_http" {
  security_group_id = "${aws_security_group.testinstance.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = [
    "${var.instance["cidr"]}",
  ]
}

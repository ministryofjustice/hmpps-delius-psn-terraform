resource "aws_security_group" "delius-psn-sg" {
  name        = "delius-psn-test-sg"
  description = "Security group for Delius PSN test instances"
  tags = {
    Name = "delius-psn-test-sg"
  }
}

resource "aws_security_group_rule" "delius-psn-sg-rule-im" {
  description       = "HTTPS for IM proxy"
  from_port         = 443
  protocol          = "TCP"
  security_group_id = "${aws_security_group.delius-psn-sg.id}"
  to_port           = 443
  type              = "ingress"
  cidr_blocks       = concat("${var.delius_preprod_gateways}", "${var.delius_prod_gateways}", "${var.psn_address_range}")
}

resource "aws_security_group_rule" "delius-psn-sg-rule-spg" {
  description       = "SPG Proxy in from PSN"
  from_port         = 9001
  protocol          = "TCP"
  security_group_id = "${aws_security_group.delius-psn-sg.id}"
  to_port           = 9001
  type              = "ingress"
  cidr_blocks       = concat("${var.delius_preprod_gateways}", "${var.delius_prod_gateways}", "${var.psn_address_range}")
}

resource "aws_security_group_rule" "delius-psn-sg-rule-ssh" {
  description       = "SSH from Delius Prod Bastion"
  from_port         = 22
  protocol          = "TCP"
  security_group_id = "${aws_security_group.delius-psn-sg.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = "${var.delius_prod_bastion_ip}"
}
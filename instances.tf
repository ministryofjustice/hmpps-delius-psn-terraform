resource "aws_instance" "delius-psn-proxy-a" {
  ami                     = "${var.proxy_ami_id}"
  instance_type           = "${var.proxy_instance_type}"
  subnet_id               = "subnet-94cb05ee"
  private_ip              = "${var.delius_psn_proxy_a_ip}"
  vpc_security_group_ids  = ["${aws_security_group.delius-psn-sg.id}"]
  disable_api_termination = true
  monitoring              = true
  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Name    = "delius-psn-proxy-a"
    Project = "Delius AWS migration"
  }
}

resource "aws_instance" "delius-psn-proxy-b" {
  ami                     = "${var.proxy_ami_id}"
  instance_type           = "${var.proxy_instance_type}"
  subnet_id               = "subnet-e34d51ae"
  private_ip              = "${var.delius_psn_proxy_b_ip}"
  vpc_security_group_ids  = ["${aws_security_group.delius-psn-sg.id}"]
  disable_api_termination = true
  monitoring              = true
  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    Name    = "delius-psn-proxy-b"
    Project = "Delius AWS migration"
  }
}



variable "psn_vpc_id" {
  value = "vpc-03a6166b"
  type = "string"
}

variable "proxy_instance_type" {
  type = "string"
  value = "t2.micro"
}

data "aws_vpc" "psn_vpc" {
  id = "${var.psn_vpc_id}"
}

data "aws_ami" "delius_psn_proxy_ami" {
  most_recent = True
  owners = []
  filter {
    name = ""
    values = []
  }

}
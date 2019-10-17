
resource "aws_launch_template" "delius-psn-proxy-a" {
  name_prefix   = "delius-psn-proxy-a"
  image_id      = "${data.delius_psn_proxy_ami.id}"
  instance_type = "${var.proxy_instance_type}"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["eu-west-2"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.delius-psn-proxy-a.id}"
    version = "$Latest"
  }
}

resource "aws_launch_template" "delius-psn-proxy-b" {
  name_prefix   = "delius-psn-proxy-b"
  image_id      = "${data.delius_psn_proxy_ami.id}"
  instance_type = "${var.proxy_instance_type}"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["eu-west-2"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.delius-psn-proxy-b.id}"
    version = "$Latest"
  }
}
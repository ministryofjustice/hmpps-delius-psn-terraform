resource "aws_route53_zone" "psn-zone" {
  name    = "psn.probation.service.justice.gov.uk."
  comment = "Delius zone"
}

resource "aws_route53_record" "psn-zone-letsencrypt" {
  name    = "_acme-challenge.psn.probation.service.justice.gov.uk."
  type    = "TXT"
  zone_id = "${aws_route53_zone.psn-zone.id}"
  records = ["1x75BCOfvM6sQLo6soUabiB_e4yTBNtiXoYVBZ139Fc"]
  ttl     = 60
}

resource "aws_route53_record" "psn-zone-spg-proxy" {
  name    = "spg-proxy.psn.probation.service.justice.gov.uk."
  type    = "A"
  zone_id = "${aws_route53_zone.psn-zone.id}"
  records = ["${var.delius_psn_proxy_b_ip}", "${var.delius_psn_proxy_a_ip}"]
  ttl     = 300
}

resource "aws_route53_record" "psn-zone-ndelius" {
  name    = "ndelius.psn.probation.service.justice.gov.uk."
  type    = "A"
  zone_id = "${aws_route53_zone.psn-zone.id}"
  records = ["${var.delius_psn_proxy_b_ip}", "${var.delius_psn_proxy_a_ip}"]
  ttl     = 300
}

resource "aws_route53_record" "psn-zone-password-reset" {
  name    = "password-reset.psn.probation.service.justice.gov.uk."
  type    = "A"
  zone_id = "${aws_route53_zone.psn-zone.id}"
  records = ["${var.delius_psn_proxy_b_ip}", "${var.delius_psn_proxy_a_ip}"]
  ttl     = 300
}

resource "aws_route53_zone" "po-zone" {
  name    = "ksscrc.org.uk."
  comment = "Delius PO zone"
  vpc {
    vpc_id     = "${var.vpc_id}"
    vpc_region = "${var.aws_region}"
  }
}

resource "aws_route53_record" "kss-prod" {
  name    = "live.ksscrc.org.uk."
  type    = "A"
  ttl     = "300"
  zone_id = "${aws_route53_zone.po-zone.zone_id}"
  records = ["${var.kss_prod_ip}"]
}

resource "aws_route53_record" "kss-pre-prod" {
  name    = "prep2.ksscrc.org.uk."
  type    = "A"
  ttl     = "300"
  zone_id = "${aws_route53_zone.po-zone.zone_id}"
  records = ["${var.kss_preprod_ip}"]
}

variable "aws_region" {
  description = "AWS region to create resources."
  type        = string
  default     = "eu-west-2"
}

variable "vpc_id" {
  description = "ID of the VPC used for the PSN"
  type        = string
  default     = "vpc-03a6166b"
}

variable "kss_prod_ip" {
  description = "IP address of the KSS production endpoint"
  type        = string
  default     = "51.231.20.158"
}

variable "kss_preprod_ip" {
  description = "IP Address of the KSS pre-production endpoint"
  type        = string
  default     = "51.231.20.157"
}

variable "proxy_instance_type" {
  description = "Instance type for the PSN proxies"
  type        = string
  default     = "t2.micro"
}

variable "proxy_ami_id" {
  description = "AMI ID for the PSN Proxies"
  type        = string
  default     = "ami-0d8e27447ec2c8410"
}

variable "delius_prod_bastion_ip" {
  description = "IP address of the Delius Production Bastion"
  type        = list
  default     = ["35.176.2.179/32"]
}

variable "psn_address_range" {
  description = "IP Range of the PSN Network"
  type        = list
  default     = ["51.0.0.0/8"]
}

variable "delius_prod_gateways" {
  description = "Delius Production environment NAT gateways"
  type        = list
  default     = ["35.178.104.253/32", "35.177.47.45/32", "52.56.115.146/32"]
}

variable "delius_preprod_gateways" {
  description = "Delius Pre-Production environment NAT gateways"
  type        = list
  default     = ["18.130.110.168/32", "35.178.44.184/32", "52.56.240.62/32"]
}

variable "delius_psn_proxy_a_ip" {
  description = "PSN address of PSN proxy in Subnet A"
  type        = string
  default     = "51.231.83.104"
}

variable "delius_psn_proxy_b_ip" {
  description = "PSN address of PSN proxy in Subnet B"
  type        = string
  default     = "51.231.83.120"
}
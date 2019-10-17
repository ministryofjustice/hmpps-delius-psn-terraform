resource "aws_iam_role" "delius_proxy_lambda_role" {
  name = "proxy_lambda_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
  } ]
}
EOF

}

resource "aws_iam_policy" "delius_proxy_lambda_policy" {
  assume_role_policy = ""
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ {
      "Effect": "Allow",
      "Resource": "*",
      "Action": [
        "ec2:DescribeInstances",
        "ec2:CreateNetworkInterface",
        "ec2:AttachNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "autoscaling:CompleteLifecycleAction"
      ]
  },
  {
    "Action": [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ],
    "Resource": "arn:aws:logs:*:*:*",
    "Effect": "Allow"
  } ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "delius_proxy_lambda_policy_attach" {
  policy_arn = "${aws_iam_policy.delius_proxy_lambda_policy}"
  role = "${aws_iam_role.delius_proxy_lambda_role}"
}


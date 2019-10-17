resource "aws_lambda_function" "" {
  function_name = "delius_proxy_attach_interface_func"
  handler = ""
  role = "${aws_iam_role.delius_proxy_lambda_role.arn}"
  runtime = ""
}
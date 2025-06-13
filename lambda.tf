resource "aws_iam role" "lambda_exec" {
  name = "${var.lambda_name}-exec"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws _iam policy_document" "lambda _assume role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals { type = "Service" identifiers = ["lambda.amazonaws.com"] }
  }
}

resource "aws_lambda_function" "main" {
  function_name = var.lambda_name
  package_type  = "Image"
  image_uri     = var.lambda_ecr_image_uri
  role          = aws_iam_role.lambda_exec.arn
  timeout       = 60
  environment {
    variables = {
      EXAMPLE = "value"
    }
  }
}

resource "aws_cloudwatch_event_rule" "schedule" {
  name                = "${var.lambda_name}-schedule"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  target_id = "lambda"
  arn       = aws_lambda_function.main.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda: InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule.arn
}
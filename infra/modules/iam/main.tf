resource "aws_iam_role" "lambda_sqs_pre_validation_payload_role" {
  name = "lambda-sqs-pre-validation-payload-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy" "send_message_sqs_policy" {
  name = "send-message-sqs-policy"
  role = aws_iam_role.lambda_sqs_pre_validation_payload_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
        ]
        Effect   = "Allow"
        Resource = lambda_sqs_pre_validation_payload.arn
      },
    ]
  })
}

resource "aws_iam_role" "validation_order_api_gateway_role" {
  name = "validation-order-api-gateway-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "api-gateway.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy" "validation_order_api_gateway_policy" {
  name = "validation-order-api-gateway-policy"
  role = aws_iam_role.validation_order_api_gateway_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "lambda:InvokeFunction",
        ]
        Effect   = "Allow"
        Resource = validation_order_api_gateway_arn
      },
    ]
  })
}

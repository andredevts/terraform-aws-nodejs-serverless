resource "aws_sqs_queue" "pre_validation_order_payload_queue" {
  name                      = "pre-validation-order-payload-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.pre_validation_order_payload_dlq_queue.arn
    maxReceiveCount     = 3
  })

  tags = {
    Environment = "dev"
  }
}

resource "aws_sqs_queue" "pre_validation_order_payload_dlq_queue" {
  name                      = "pre-validation-order-payload-dlq-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  
  tags = {
    Environment = "dev"
  }
}
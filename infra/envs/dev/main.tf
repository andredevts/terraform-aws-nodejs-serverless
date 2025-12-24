module "iam" {
  source                                 = "../modules/iam"
  environment                            = "dev"
  pre_validation_order_payload_queue_url = module.sqs.pre_validation_order_payload_queue_url
  validation_order_api_gateway_arn       = module.api_gateway.validation_order_api_gateway_arn
  lambda_pre_validation_arn              = module.lambda.lambda_pre_validation_arn
  
  tags = {
    Environment = "dev"
  }
}

module "sqs" {
  source      = "../modules/sqs"
  environment = "dev"

  tags = {
    Environment = "dev"
  }
}

module "lambda" {
  source                                 = "../modules/lambda"
  environment                            = "dev"
  pre_validation_order_payload_queue_url = module.sqs.pre_validation_order_payload_queue_url
  aws_iam_lambda_role                    = module.iam.aws_iam_lambda_role

  tags = {
    Environment = "dev"
  }
}

module "api_gateway" {
  source                    = "../modules/api_gateway"
  lambda_pre_validation_arn = module.lambda.lambda_pre_validation_arn

  tags = {
    Environment = "dev"
  }
}



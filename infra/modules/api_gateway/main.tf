resource "aws_api_gateway_rest_api" "validation_order_api_gateway" {
  name = "api-gateway-validation-order-api-gateway"
}

resource "aws_api_gateway_resource" "orders_resource_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.validation_order_api_gateway.id
  parent_id   = aws_api_gateway_rest_api.validation_order_api_gateway.root_resource_id
  path_part   = "orders"
}

resource "aws_api_gateway_method" "order_resource_post_method" {
  rest_api_id   = aws_api_gateway_rest_api.validation_order_api_gateway.id
  resource_id   = aws_api_gateway_resource.orders_resource_api_gateway.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "order_resource_post_integration" {
  rest_api_id             = aws_api_gateway_rest_api.validation_order_api_gateway.id
  resource_id             = aws_api_gateway_resource.orders_resource_api_gateway.id
  http_method             = aws_api_gateway_method.order_resource_post_method.http_method
  type                    = "AWS_PROXY"
  uri                     = lambda_pre_validation_arn
}
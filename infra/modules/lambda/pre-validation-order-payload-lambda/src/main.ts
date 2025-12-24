import { APIGatewayEvent, APIGatewayProxyResultV2, Context } from 'aws-lambda';
import { SendMessageCommand, SendMessageRequest, SQSClient } from '@aws-sdk/client-sqs';

interface OrderPayload {
  orderId: string;
  customerId: string;
  items: Array<Product>;
}

interface Product {
  productName: string;
  quantity: number;
}

export const handler = async (
  event: APIGatewayEvent,
  Context: Context
): Promise<any> => {
  console.log('Get The Event: ', event);

  if (!event.body)
    return <APIGatewayProxyResultV2>{
      statusCode: 400,
      headers: { 'Content-Type': 'application/json' },
      body: 'No body',
    };

  try {
    const payload: OrderPayload = JSON.parse(event.body);

    const sqsClient = new SQSClient();

    sqsClient.send(<SendMessageCommand>{
      input: <SendMessageRequest>{
        QueueUrl: process.env.pre_validation_order_payload_queue_url,
        DelaySeconds: 3,
        MessageBody: JSON.stringify(payload)
      },
    });
  } catch (error) {
    <APIGatewayProxyResultV2>{
      statusCode: 400,
      headers: { 'Content-Type': 'application/json' },
      body: 'Object incompatible',
    };
  }
};

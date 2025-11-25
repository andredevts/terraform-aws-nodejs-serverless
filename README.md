## Disclaimer ⚠️

> Esse projeto está em construção. 

![#terraform-aws-nodejs-serverless
Esse projeto consiste em aplicar conhecimentos de Serverless na AWS com Node.JS com Lambda.
](https://github.com/andredevts/terraform-aws-nodejs-serverless/blob/main/Terraform-AWS-Node-Serverless.png)

### Apresentação do Problema

Imagine que estamos construíndo um sistema para um Restaurante para pedidos do **Ifood**. Esse projeto precisa ter uma arquitetura que suporte pedidos através de uma chamada **HTTP** ou um arquivo **JSON**. Esse projeto precisa ser escalável e na nuvem.

---

### Solução

Dado o problema vamos então criar uma Arquitetura de Processamento de Pedidos e Arquivos na **AWS**, totalmente **Serverless**. Esse projeto irá usar diversos serviços **Serverless** para demonstrar um fluxo de agendamentos de pedidos.

A arquitetura do projeto utiliza os seguintes serviços da **AWS**:

- **[API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/)** — entrada HTTP para receber requisições de pedidos.
- **[AWS Lambda](https://docs.aws.amazon.com/lambda/latest/dg/welcome.html)** — execução do código serverless (processamento dos pedidos).
- **[Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)** — filas para orquestrar processamento assíncrono e desacoplado.
- **[Amazon SNS](https://docs.aws.amazon.com/sns/latest/dg/welcome.html)** — publicação/assinatura para notificações e broadcast de eventos.
- **[Amazon DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Welcome.html)** — armazenamento NoSQL de baixa latência para estados e metadados.
- **[Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html)** — armazenamento de arquivos (ex.: payloads JSON, artefatos).
- **[Amazon EventBridge](https://docs.aws.amazon.com/eventbridge/latest/userguide/)** — barramento de eventos para integrar fluxos e regras baseadas em eventos.

---

### Observações

Esse projeto usa a seguinte stack

- Node.JS 22.x
- aws-sdk-js-v3 v3.938.0
- Terraform v1.14.0

Para rodar esse projeto não esqueça de exportar suas credentials da AWS

```console
export AWS_ACCESS_KEY_ID=

export AWS_SECRET_ACCESS_KEY=
```

**Para fins didáticos o state do Terraform está em bootstrap!**


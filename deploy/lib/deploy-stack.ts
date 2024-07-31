import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';
import * as dotenv from 'dotenv';

dotenv.config();

export class DeployStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

     const mainFunction = new lambda.Function(this, 'MainFunction', {
      runtime: lambda.Runtime.NODEJS_20_X,
      handler: 'dist/main.handler',
      code: lambda.Code.fromAsset('../dist'),
      environment: {
        DB_HOST: process.env.DB_HOST!,
        DB_PORT: process.env.DB_PORT!,
        DB_USERNAME: process.env.DB_USERNAME!,
        DB_PASSWORD: process.env.DB_PASSWORD!,
        DB_NAME: process.env.DB_NAME!,
      },
      timeout: cdk.Duration.minutes(1),
    });

    const api = new apigateway.RestApi(this, 'ServerlessExampleApi', {
      restApiName: 'Serverless Example API',
    });

    const lambdaIntegration = new apigateway.LambdaIntegration(mainFunction);

    api.root.addMethod('ANY', lambdaIntegration);

    api.root.addResource('{proxy+}').addMethod('ANY', lambdaIntegration);
  }
}

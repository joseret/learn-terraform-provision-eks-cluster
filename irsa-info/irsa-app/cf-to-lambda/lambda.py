import json

def lambda_handler(event, context):
    input_data = json.loads(event['body'])
    # Process input_data
    result = {'message': 'Hello from AWS Lambda!'}
    return {
        'statusCode': 200,
        'body': json.dumps(result)
    }

import json
import requests
from google.oauth2 import id_token
from google.auth.transport import requests as google_auth_requests

def invoke_aws_lambda(request):
    audience = "YOUR_AWS_ACCOUNT_ID.lambda-url.us-east-1.amazonaws.com"  # Replace with your AWS values
    url = "https://YOUR_LAMBDA_FUNCTION_URL"  # Replace with your Lambda URL
    payload = json.dumps(request.get_json())  # Get data from the incoming request

    headers = {
        "Content-Type": "application/json"
    }

    # Get GCP credentials to exchange for AWS credentials
    auth_req = google_auth_requests.Request()
    id_token_obj = id_token.fetch_id_token(auth_req, audience)

    headers["Authorization"] = f"Bearer {id_token_obj}"

    response = requests.post(url, data=payload, headers=headers)
    return response.json()

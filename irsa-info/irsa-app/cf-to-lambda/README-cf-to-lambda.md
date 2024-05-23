Workload Identity Federation:

GCP:

Create a Workload Identity Pool.
Create a Provider for AWS.
Grant the Cloud Function's service account the permission roles/iam.workloadIdentityUser.
AWS:

Create an IAM Role.
Define a trust policy to allow the GCP Workload Identity Pool to assume this role.
Attach policies to the IAM Role granting access to Lambda.

https://medium.com/teamsnap-engineering/accessing-aws-resources-from-google-kubernetes-engine-3df21a8ca297


API Key/Secret:

AWS:
Create an API key or secret with permissions to invoke the Lambda function.
GCP:
Securely store the API key or secret (e.g., in Secret Manager).
Retrieve and use it in the Cloud Function code.
Key Points

Security: Always prioritize Workload Identity Federation over API keys/secrets.
Permissions: Carefully define IAM roles and policies in AWS to follow the principle of least privilege.
Error Handling: Implement robust error handling in both the GCP Cloud Function and AWS Lambda to address potential authentication or communication issues.
Documentation: Refer to GCP and AWS documentation for detailed instructions on setting up Workload Identity Federation or using API keys/secrets.
Libraries: Consider using the AWS SDK for Python in your GCP Cloud Function to streamline interactions with AWS services.
Let me know if you'd like a more detailed guide on any of the steps or alternative approaches!

https://medium.com/teamsnap-engineering/accessing-aws-resources-from-google-kubernetes-engine-3df21a8ca297
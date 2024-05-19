#!/usr/bin/env python

# Copyright 2019 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import logging
import sys
import time


# [START storage_list_files]
from google.cloud import storage

logging.warning('Test Log')

def list_blobs(bucket_name):
    """Lists all the blobs in the bucket."""
    # bucket_name = "your-bucket-name"

    storage_client = storage.Client()

    # Note: Client.list_blobs requires at least package version 1.17.0.
    blobs = storage_client.list_blobs(bucket_name)

    # Note: The call returns a response only when the iterator is consumed.
    for blob in blobs:
        print(blob.name)


# [END storage_list_files]

# class CustomAwsSupplier(AwsSecurityCredentialsSupplier):
#   def get_aws_security_credentials(self, context, request):
#     audience = context.getAudience()
#     try:
#       return custom_retrieve_aws_security_credentials(audience)
#     except:
#       raise IOError()
  
  
#   def get_aws_region(self, context, request):
#     try:
#       return custom_retrieve_aws_region()
#     except:
#       raise IOError()

#   def custom_retrieve_aws_security_credentials(audience) {
#     // Retrieve Aws security credentials for the requested audience.

#   }

#   def custom_retrieve_aws_region() {
#     // Retrieve current AWS region.
#     return "us-east-2"
#   }  

# awsSupplier = CustomAwsSupplier();
# credentials = AwsCredentials.newBuilder()
#   .setSubjectTokenType(SubjectTokenTypes.AWS4) // Sets the subject token type.
#   .setAudience(...) // Sets the GCP audience.
#   .setAwsSecurityCredentialsSupplier(supplier) // Sets the supplier.
#   .build();

#  eval $(aws sts assume-role-with-web-identity --role-arn $AWS_ROLE_ARN --role-session-name ${session_name} --web-identity-token $(cat $AWS_WEB_IDENTITY_TOKEN_FILE) | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

response = client.assume_role_with_web_identity(
    DurationSeconds=3600,
    # Policy='{"Version":"2012-10-17","Statement":[{"Sid":"Stmt1","Effect":"Allow","Action":"s3:ListAllMyBuckets","Resource":"*"}]}',
    ProviderId='www.amazon.com',
    RoleArn='arn:aws:iam::123456789012:role/FederatedWebIdentityRole',
    RoleSessionName='app1',
    WebIdentityToken='Atza%7CIQEBLjAsAhRFiXuWpUXuRvQ9PZL3GMFcYevydwIUFAHZwXZXXXXXXXXJnrulxKDHwy87oGKPznh0D6bEQZTSCzyoCtL_8S07pLpr0zMbn6w1lfVZKNTBdDansFBmtGnIsIapjI6xKR02Yc_2bQ8LZbUXSGm6Ry6_BG7PrtLZtj_dfCTj92xNGed-CrKqjG7nPBjNIL016GGvuS5gSvPRUxWES3VYfm1wl7WTI7jn-Pcb6M-buCgHhFOzTQxod27L9CqnOLio7N3gZAGpsp6n1-AJBOCJckcyXe2c6uD0srOJeZlKUm2eTDVMf8IehDVI0r1QOnTV6KzzAI3OY87Vd_cVMQ',
)

if __name__ == "__main__":
  while True:
    logging.warning("listing...\n\n\n")
    try:
      list_blobs(bucket_name=sys.argv[1])
    except:
      logging.exception('Got exception on list_blobs')
    logging.warning("sleeping...\n\n\n")
    time.sleep(10)
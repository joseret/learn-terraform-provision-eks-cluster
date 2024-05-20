aws eks update-kubeconfig --region us-east-2 --name aws-brcm-irsa-3

aws ecr create-repository \
    --repository-name joseret-repo1 \
    --region us-east-2

podman tag gcs_list_files:v0.0.1  660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1/gcs_list_files:v0.0.1 
podman push 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1/gcs_list_files:v0.0.1 
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:us-east-2:660387449292:repository/joseret-repo1",
        "registryId": "660387449292",
        "repositoryName": "joseret-repo1",
        "repositoryUri": "660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1",
        "createdAt": "2024-05-18T19:28:41.786000-07:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}

aws ecr get-login-password --region us-east-2 | podman login --username AWS --password-stdin 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1
podman push 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1/gcs_list_files:v0.0.1 

aws ecr create-repository \
    --repository-name joseret-repo-2/test1 \
    --region us-east2

https://stackoverflow.com/questions/64232268/storing-images-in-aws-ecr-using-namespaces

## Test App
```
aws ecr get-login-password --region us-east-2 | podman login --username AWS --password-stdin 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1
```

```
docker build --tag  660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1:v0.0.2 .
docker push 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1:v0.0.2
```


## addon

aws eks create-addon --cluster-name aws-brcm-irsa-3 --region us-east-2 --addon-name eks-pod-identity-agent --addon-version v1.0.0-eksbuild.1
{
    "addon": {
        "addonName": "eks-pod-identity-agent",
        "clusterName": "aws-brcm-irsa-3",
        "status": "CREATING",
        "addonVersion": "v1.0.0-eksbuild.1",
        "health": {
            "issues": []
        },
        "addonArn": "arn:aws:eks:us-east-2:660387449292:addon/aws-brcm-irsa-3/eks-pod-identity-agent/dcc7c911-9814-12f3-8ea0-20bebab1de3c",
        "createdAt": "2024-05-19T11:35:30.998000-07:00",
        "modifiedAt": "2024-05-19T11:35:31.106000-07:00",
        "tags": {}
    }
}

 aws eks describe-addon --cluster-name aws-brcm-irsa-3 --region us-east-2 --addon-name eks-pod-identity-agent --query "addon.addonVersion" --output text

aws eks describe-cluster --name  aws-brcm-irsa-3 --region us-east-2 --query "cluster.identity.oidc.issuer"

```
cat >my-policy.json <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-pod-secrets-bucket"
        }
    ]
}
EOF
```


aws iam create-role --role-name=jr-app-a-ksa \
    --assume-role-policy-document file://trust-policy.json

"python3" "gcs_list_files.py", "joseret-temp-5683"

aws iam get-role --role-name jr-app-a-ksa  --query Role.AssumeRolePolicyDocument

aws sts assume-role-with-web-identity --role-arn $AWS_ROLE_ARN --role-session-name x123x --web-identity-token $(cat $AWS_WEB_IDENTITY_TOKEN_FILE) --debug
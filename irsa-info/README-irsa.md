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
```

```
podman build --tag  660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1:v0.0.1 .
podman push 660387449292.dkr.ecr.us-east-2.amazonaws.com/joseret-repo1:v0.0.1
```
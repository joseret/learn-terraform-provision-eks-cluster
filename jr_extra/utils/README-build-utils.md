```
gcloud builds submit --config=cloudbuild.yaml . --substitutions="_APP_VERSION=v0.2.2023-12-01,_APP_REGISTRY=us-central1-docker.pkg.dev/hybrid-test-001/hybrid-test-001/utils/build-utils,_CLOUD_BUILD_DIR=$PWD" --project hybrid-test-001
```


```
gcloud builds submit --config=jr_extra/bcl1/cloudbuild.yaml . --substitutions="_APPLY_AFTER_PLAN=No,_MANUAL_BRANCH=?" --project hybrid-test-001
```

```
gcloud builds submit --config=/Users/joseret/g/pso/mc1/jr-learn-terraform-provision-eks-cluster/jr_extra/helm1/cloudbuild.yaml /Users/joseret/g/pso/mc1/jr-learn-terraform-provision-eks-cluster/jr_extra/helm1 --substitutions="_APPLY_AFTER_PLAN=No,_MANUAL_BRANCH=?" --project hybrid-test-001
```

```
export KUBECONFIG=$HOME/aws1
aws eks update-kubeconfig --region us-east1 --name cbnk-aws-v1
```
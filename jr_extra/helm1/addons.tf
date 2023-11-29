resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  values = [
    file("${path.module}/nginx-values.yaml")
  ]
}

# resource "helm_release" "aws-calico" {
#   name       = "aws-calico"
#   repository = "https://docs.tigera.io/calico/charts"
#   repository = "https://pat@raw.githubusercontent.com/joseret/jr-cb1-helm-v1/main/charts/"
# 
#   chart      = "tigera-operator"

#   values = [
#     file("${path.module}/nginx-values.yaml")
#   ]
# }

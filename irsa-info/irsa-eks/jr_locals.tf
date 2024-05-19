locals {
  jr_cluster_name   = format("aws-%s", local.jr_cluster_suffix)
  jr_cluster_suffix = "brcm-irsa-3"
}

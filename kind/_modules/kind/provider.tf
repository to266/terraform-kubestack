provider "kind" {}

provider "kustomization" {
  kubeconfig_raw = kind_cluster.current.kubeconfig
}

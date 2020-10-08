module "cluster_services" {
  source = "../../../common/cluster_services"

  manifest_path = var.manifest_path

  depends_on = [kind_cluster.current]
}

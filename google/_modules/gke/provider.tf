data "google_client_config" "default" {
}

provider "kubernetes" {
  alias = "gke"

  load_config_file = false

  host = "https://${google_container_cluster.current.endpoint}"
  cluster_ca_certificate = base64decode(
    google_container_cluster.current.master_auth[0].cluster_ca_certificate,
  )
  token = data.google_client_config.default.access_token
}

data "template_file" "kubeconfig" {
  template = file("${path.module}/templates/kubeconfig.tpl")

  vars = {
    cluster_name     = google_container_cluster.current.name
    cluster_endpoint = google_container_cluster.current.endpoint
    cluster_ca       = google_container_cluster.current.master_auth[0].cluster_ca_certificate
    path_cwd         = path.cwd
  }
}

provider "kustomization" {
  kubeconfig_raw = data.template_file.kubeconfig.rendered
}

data "kustomization" "current" {
  # path to kustomization directory
  path = var.manifest_path
}

resource "kustomization_resource" "current" {
  for_each = data.kustomization.current.ids

  manifest = data.kustomization.current.manifests[each.value]
}

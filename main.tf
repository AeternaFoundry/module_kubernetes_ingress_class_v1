resource "kubernetes_ingress_class_v1" "ingress_class_v1s" {
  for_each = var.ingress_class_v1s


  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
  }

  spec {
    controller = each.value.spec.controller
    dynamic "parameters" {
      for_each = each.value.spec.parameters != null ? each.value.spec.parameters : []
      content {
        api_group = parameters.value.api_group
        kind      = parameters.value.kind
        name      = parameters.value.name
        namespace = parameters.value.namespace
        scope     = parameters.value.scope
      }
    }
  }
}


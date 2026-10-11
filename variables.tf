variable "ingress_class_v1s" {
  description = <<EOT
Map of ingress_class_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
    - spec (block):
        - controller (optional)
        - parameters (optional, block):
            - api_group (optional)
            - kind (required)
            - name (required)
            - namespace (optional)
            - scope (optional)
EOT

  type = map(object({
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
    })
    spec = object({
      controller = optional(string)
      parameters = optional(list(object({
        api_group = optional(string)
        kind      = string
        name      = string
        namespace = optional(string)
        scope     = optional(string)
      })))
    })
  }))
}


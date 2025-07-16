locals {
  # 1) Lee tu plantilla atlas.hcl.tpl y reemplaza las variables
  atlas_config = templatefile("${path.module}/atlas.hcl.tpl", {
    db_url      = var.db_url
  })

  # 2) Concatena todos tus .hcl de esquema en un único string
  schema_files = fileset("${path.module}/schemas", "**/*.hcl")
  schema_hcl   = join(
    "\n",
    [for f in local.schema_files : file("${path.module}/schemas/${f}")]
  )
}

resource "atlas_schema" "all" {
  url      = var.db_url
  env_name = "dev"          # <-- aquí
  hcl      = local.schema_hcl
  config   = local.atlas_config
}

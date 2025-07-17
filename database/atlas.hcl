variable "schemas" {
  type = list(string)
  default = [
    "file://schema/config",
    "file://schema/company",
    "file://schema/company/status_type",
    "file://schema/company/utils",
    "file://schema/vtigercrm_2022",
    "file://schema/aetna",
    "file://schema/molina",
    "file://schema/oscar",
    "file://schema/ambetter"
  ]
}

variable "migrations" {
  type = string
  default = "file://migrations"
}

env "dev" {
  url = "postgres://postgres:postgres@postgresql.mabecenter.org:5432/demo"

  schema {
    src = var.schemas
  }

  migration {
    dir = var.migrations
  }
  
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}
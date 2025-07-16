env "development" {
  url = "postgres://postgres:XXXXXX@postgresql.mabecenter.org:5432/demo"

  schema {
    src = concat(
      fileset("schemas/aetna/**/*.hcl"),
      fileset("schemas/ambetter/**/*.hcl"),
      fileset("schemas/company/**/*.hcl"),
      fileset("schemas/config/**/*.hcl"),
      fileset("schemas/molina/**/*.hcl"),
      fileset("schemas/oscar/**/*.hcl"),
      fileset("schemas/aetna/**/*.hcl"),
      fileset("schemas/vtigercrm_2022/**/*.hcl")
    )
  }

  migration {
    dir = "migrations"
  }
  
  format {
    migrate {
      diff = "{{ sql . \"  \" }}"
    }
  }
}
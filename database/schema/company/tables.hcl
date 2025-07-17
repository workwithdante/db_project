schema "company" {
}

table "broker_info" {
  schema = schema.company

  column "id" {
    type = serial
    null = false
  }
  column "name" {
    type = text
    null = false
  }
  column "npn" {
    type = integer
    null = false
  }

  primary_key {
    columns = [column.id]
  }

  unique "broker_info_npn_key" {
    columns = [column.npn]
  }
}

table "status_type" {
  schema = schema.company

  column "id" {
    type = serial
    null = false
  }
  column "name" {
    type = text
    null = false
  }
  column "error" {
    type    = boolean
    null    = false
    default = false
  }

  primary_key {
    columns = [column.id]
  }

  unique "status_type_name_key" {
    columns = [column.name]
  }
}

table "review_type" {
  schema = schema.company
  
  column "id" {
    type = serial
    null = false
  }
  column "name" {
    type = text
    null = false
  }
  column "error" {
    type    = boolean
    null    = false
    default = false
  }

  primary_key {
    columns = [column.id]
  }

  unique "review_type_name_key" {
    columns = [column.name]
  }
}

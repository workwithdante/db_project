schema "config" {}
schema "schema" {}

table "dispatcher" {
  schema = schema.config
  column "id" {
    type = serial
    null = false
  }
  column "company" {
    type = text
    null = false
  }
  column "broker_id" {
    type = int
    null = false
  }
  column "tbl" {
    type = text
    null = false
  }

  primary_key {
    columns = [column.id]                          # IDENTIFICADOR desnudo
  }

  unique unique_company_broker {
    columns = [company, broker_id]          # IDENTIFICADORES desnudos
  }

  foreign_key "fk_broker" {
    columns = [broker_id]

    references {
      schema  = schema.company
      table   = broker_info
      columns = [id]
    }

    on_update = cascade                    # bareword, sin comillas
    on_delete = restrict                   # bareword, sin comillas
  }
}

table "fields" {
  column "id" {
    type = serial
    null = false
  }
  column "field_name" {
    type = text
    null = false
  }
  column "mandatory" {
    type    = bool
    null    = false
    default = false
  }

  primary_key {
    columns = [id]
  }

  unique fields_field_name_key {
    columns = [field_name]
  }
}

table "input_field" {
  column "dispatcher_id" {
    type = int
    null = false
  }
  column "field_id" {
    type = int
    null = false
  }
  column "column_name" {
    type = text
    null = false
  }

  primary_key {
    columns = [dispatcher_id, field_id]
  }

  foreign_key input_field_dispatcher_id_fkey {
    columns = [dispatcher_id]
    references {
      schema  = config
      table   = dispatcher
      columns = [id]
    }
    on_delete = cascade
  }

  foreign_key input_field_field_id_fkey {
    columns = [field_id]
    references {
      schema  = config
      table   = fields
      columns = [id]
    }
    on_delete = cascade
  }
}

table "rules" {
  column "rule_fn" {
    type = regprocedure
    null = false
  }
  column "result_label" {
    type = text
    null = false
  }
  column "priority" {
    type = int
    null = false
  }

  primary_key {
    columns = [rule_fn]
  }

  unique rules_result_label_key {
    columns = [result_label]
  }
}

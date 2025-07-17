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
    columns = [column.company, column.broker_id]          # IDENTIFICADORES desnudos
  }

  foreign_key "fk_broker" {
    columns = [column.broker_id]

    ref_columns = [table.broker_info.column.id]

    on_update = CASCADE                    # bareword, sin comillas
    on_delete = RESTRICT                   # bareword, sin comillas
  }
}

table "fields" {
  schema = schema.config

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
    columns = [column.id]
  }

  unique fields_field_name_key {
    columns = [column.field_name]
  }
}

table "input_field" {
  schema = schema.config

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
    columns = [column.dispatcher_id, column.field_id]
  }

  foreign_key input_field_dispatcher_id_fkey {
    columns = [column.dispatcher_id]
    ref_columns = [table.dispatcher.column.id]
    on_delete = CASCADE
  }

  foreign_key input_field_field_id_fkey {
    columns = [column.field_id]

    ref_columns = [table.fields.column.id]
    on_delete = CASCADE
  }
}

table "rules" {
  schema = schema.config

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
    columns = [column.rule_fn]
  }

  unique rules_result_label_key {
    columns = [column.result_label]
  }
}

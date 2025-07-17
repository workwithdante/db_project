table "status_results" {
  schema = schema.company

  # Columnas
  column "id" {
    type = sql("serial")
  }
  column "process_date" {
    type   = sql("timestamp without time zone")
    null   = false
  }
  column "batch_name" {
    type   = text
    null   = false
  }
  column "company" {
    type   = text
    null   = false
  }
  column "broker" {
    type   = int
    null   = false
  }
  column "status" {
    type   = text
    null   = false
  }
  column "crm_data" {
    type = jsonb
  }
  column "csv_data" {
    type = jsonb
  }
  column "review" {
    type    = text
    default = sql("NULL")
  }
  column "description" {
    type    = text
    default = sql("NULL")
  }

  # Clave primaria compuesta
  primary_key {
    columns = [column.id, column.process_date]
  }

  # Particionamiento por rango sobre process_date
  partition {
    type    = RANGE
    columns = [column.process_date]
  }
}

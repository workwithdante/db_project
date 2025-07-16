schema "company" {
  table "status_results" {
    partition {
      type    = RANGE
      columns = [column.process_date]
    }
  }
}

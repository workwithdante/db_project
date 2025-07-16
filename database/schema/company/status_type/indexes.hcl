schema "company" {
  index "idx_status_date" {
    table   = table.status_results
    columns = [column.process_date]
  }
}

schema "company" {
  table "status_results" {
    check "chk_process_date" { expr = "process_date > '2000-01-01'" }
  }
}

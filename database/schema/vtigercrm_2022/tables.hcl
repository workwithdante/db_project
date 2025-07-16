schema "vtigercrm_2022" {
  table "calendar_blank" {
    column "cal_date" {
      type = date
      null = false
    }

    primary_key {
      columns = [column.cal_date]
    }
  }
}

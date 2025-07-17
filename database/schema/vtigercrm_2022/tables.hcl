table "calendar_blank" {
  schema = schema.vtigercrm_2022

  column "cal_date" {
    type = date
    null = false
  }

  primary_key {
    columns = [column.cal_date]
  }
}
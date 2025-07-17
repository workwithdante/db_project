view "bs" {
  schema = schema.oscar
  
  as = <<-SQL
    SELECT
      temp.*,
      CASE "Policy status"
        WHEN 'Active'        THEN company.last_day_curdate()
        WHEN 'Grace period'  THEN company.last_day_last_month()
        WHEN 'Delinquent'    THEN company.last_day_two_last_month()
        ELSE NULL
      END AS paid_through_date
    FROM oscar.temp AS temp;
  SQL
}

view "adc" {
  schema = schema.oscar

  as = <<-SQL
    SELECT
      temp.*,
      CASE "Policy status"
        WHEN 'Active'        THEN company.last_day_curdate()
        WHEN 'Grace period'  THEN company.last_day_last_month()
        WHEN 'Delinquent'    THEN company.last_day_two_last_month()
        ELSE NULL
      END AS paid_through_date
    FROM oscar.temp AS temp;
  SQL
}

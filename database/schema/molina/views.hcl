schema "molina" {
  view "bs" {
    depends_on = [table.temp]
    query = <<-SQL
      WITH temp2 AS (
        SELECT
          t.*,
          (
            CASE
              WHEN t."Status" = 'Active'
              THEN company.last_day_curyear()
              ELSE t."End_Date"
            END
          )::date AS termination_date
        FROM molina.temp AS t
      )
      SELECT
        temp2.*,
        CASE
          WHEN temp2."Status" = 'Active'
          THEN 'Active'
          ELSE 'Inactive'
        END AS policy_status
      FROM temp2;
    SQL
  }
}

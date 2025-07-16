schema "ambetter" {
  view "bs" {
    depends_on = [table.temp]
    query = <<-SQL
      SELECT
        temp.*,
        CASE
          WHEN (temp."Broker Effective Date"::date   > CURRENT_DATE)
            OR (temp."Policy Effective Date"::date   > CURRENT_DATE)
            OR (temp."Policy Term Date"::date       > CURRENT_DATE)
            OR (temp."Paid Through Date"::date      > CURRENT_DATE)
          THEN 'Active'
          ELSE 'Inactive'
        END AS policy_status
      FROM ambetter.temp AS temp;
    SQL
  }
}

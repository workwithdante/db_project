view "bs" {
  schema = schema.aetna

  as = <<-SQL
    SELECT
      temp.*
    FROM aetna.temp AS temp
    WHERE temp."Relationship" = 'Self';
  SQL
}

schema "aetna" {
  view "bs" {
    depends_on = [table.temp]
    query = <<-SQL
      SELECT
        temp.*
      FROM aetna.temp AS temp
      WHERE temp."Relationship" = 'Self';
    SQL
  }
}

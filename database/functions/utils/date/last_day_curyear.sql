-- functions/company/last_day_curyear.sql
CREATE OR REPLACE FUNCTION company.last_day_curyear()
  RETURNS TEXT
  LANGUAGE SQL IMMUTABLE AS $$
    SELECT make_date(EXTRACT(YEAR FROM current_date)::int, 12, 31)::DATE;
  $$;

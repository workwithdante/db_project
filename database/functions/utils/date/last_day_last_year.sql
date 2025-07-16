-- functions/company/last_day_last_year.sql
CREATE OR REPLACE FUNCTION company.last_day_last_year()
  RETURNS TEXT
  LANGUAGE SQL IMMUTABLE AS $$
    SELECT make_date(EXTRACT(YEAR FROM current_date)::int, 12, 31)::DATE - INTERVAL '1 year';
  $$;

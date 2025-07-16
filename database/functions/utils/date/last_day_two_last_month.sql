-- functions/company/last_day_two_last_month.sql
CREATE OR REPLACE FUNCTION company.last_day_two_last_month()
  RETURNS TEXT
  LANGUAGE SQL IMMUTABLE AS $$
    SELECT (date_trunc('month', current_date) - INTERVAL '1 month' - INTERVAL '1 day')::DATE;
  $$;

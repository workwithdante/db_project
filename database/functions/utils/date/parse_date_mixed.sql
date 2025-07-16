-- functions/company/parse_date_mixed.sql

DROP FUNCTION IF EXISTS company.parse_date_mixed(TEXT);

CREATE OR REPLACE FUNCTION company.parse_date_mixed(val TEXT)
RETURNS DATE
LANGUAGE sql IMMUTABLE AS $$
  SELECT CASE
    WHEN val IS NULL                           THEN NULL
    WHEN val ~ '^\d{4}-\d{2}-\d{2}$'           THEN val::DATE
    WHEN val ~ '^\d{1,2}/\d{1,2}/\d{4}$'       THEN to_date(val, 'MM/DD/YYYY')
    ELSE NULL
  END;
$$;

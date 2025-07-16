-- functions/company/normalize_member_id.sql

DROP FUNCTION IF EXISTS company.normalize_member_id(TEXT);

CREATE OR REPLACE FUNCTION company.normalize_member_id(input TEXT) RETURNS TEXT
LANGUAGE sql
IMMUTABLE AS $$
  SELECT split_part(input, '-', 1);
$$;

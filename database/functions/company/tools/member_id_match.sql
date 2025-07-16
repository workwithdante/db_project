-- functions/company/member_id_match.sql

DROP FUNCTION IF EXISTS company.member_id_match(TEXT, TEXT);

CREATE OR REPLACE FUNCTION company.member_id_match(a TEXT, b TEXT) RETURNS BOOLEAN
LANGUAGE sql
IMMUTABLE AS $$
  SELECT company.normalize_member_id(a) = company.normalize_member_id(b);
$$;

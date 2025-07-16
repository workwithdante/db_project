-- functions/company/doesnt_exists_so_no.sql

DROP FUNCTION IF EXISTS company.doesnt_exists_so_no(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.doesnt_exists_so_no(
  input_data_csv JSONB,
  input_data_crm JSONB
)
RETURNS config.rule_out
LANGUAGE plpgsql IMMUTABLE AS
$$
DECLARE
  exists_so_no           TEXT := input_data_crm ->> 'so_no';
  out_rec               config.rule_out;
BEGIN
  IF exists_so_no IS NULL THEN
    out_rec.applies   := TRUE;
  ELSE
    out_rec.applies   := FALSE;
  END IF;

  RETURN out_rec;
END;
$$;

-- functions/company/doesnt_exists_member_id.sql

DROP FUNCTION IF EXISTS company.doesnt_exists_member_id(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.doesnt_exists_member_id(
  input_data_csv JSONB,
  input_data_crm JSONB
)
RETURNS config.rule_out
LANGUAGE plpgsql IMMUTABLE AS
$$
DECLARE
  doesnt_exists_member_id TEXT   := input_data_csv ->> 'member_id';
  premium                   NUMERIC;
  ticket                    TEXT[] := company.get_tickets(input_data_crm);
  paid_pending              BOOLEAN;
  problem_pending           BOOLEAN;
  out_rec                   config.rule_out;
BEGIN
  IF doesnt_exists_member_id IS NULL THEN
    out_rec.applies := TRUE;
    premium := (input_data_csv ->> 'premium')::numeric;
    paid_pending := (ticket && ARRAY['PAGO', 'PRIMER PAGO']) OR premium = 0;
    problem_pending := ticket && ARRAY['PROBLEMA PAGO', 'PROBLEMA CAMP', 
      'PROBLEMA PAGO / CAMP', 'CASOS MP'];
  ELSE
    out_rec.applies := FALSE;
    RETURN out_rec;
  END IF;

  IF problem_pending THEN
    out_rec.label_out := 'Doesnt exist in csv with problems';
    RETURN out_rec;
  END IF;

  IF NOT paid_pending THEN
    out_rec.label_out := 'Doesnt exist in csv without paid';
    RETURN out_rec;
  END IF;

  IF paid_pending THEN
    out_rec.label_out := 'Doesnt exist in csv with paid';
    RETURN out_rec;
  END IF;

  RETURN out_rec;
END;
$$;

-- functions/company/compare_json.sql

DROP FUNCTION IF EXISTS company.compare_json_keys(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.compare_json_keys(
  input_data_csv JSONB,
  input_data_crm JSONB
)
RETURNS config.rule_out
LANGUAGE plpgsql IMMUTABLE AS
$$
DECLARE
  rec                         RECORD;
  crm_val                     JSONB;
  ticket                      TEXT[] := company.get_tickets(input_data_crm);
  out_rec config.rule_out;
BEGIN
  FOR rec IN
    SELECT key, value
      FROM jsonb_each(input_data_csv)
  LOOP
    IF input_data_crm ? rec.key AND rec.key <> 'paid_through_date' THEN
      crm_val := input_data_crm -> rec.key;
      IF rec.value IS DISTINCT FROM crm_val THEN
        out_rec.applies   := TRUE;
        IF rec.key = 'effective_partial_date'
          AND (input_data_csv->>'effective_partial_date' = input_data_crm->>'effective_date' 
          OR input_data_csv->>'premium' = input_data_crm->>'premium') THEN
          out_rec.applies := FALSE;
        END IF;

        IF rec.key = 'termination_partial_date'
          AND (input_data_csv->>'termination_partial_date' = input_data_crm->>'termination_date' 
          AND input_data_csv->>'problem' = 'CAMBIO DE VIDA') THEN
          out_rec.applies := FALSE;
        END IF;

        IF rec.key = 'premium'
          AND input_data_csv->>'premium' = input_data_crm->>'next_premium' THEN
          out_rec.applies := FALSE;
        END IF;

        IF out_rec.applies AND ticket && ARRAY['PROBLEMA CAMP','CASOS MP']
        THEN
          out_rec.label_out := FORMAT('%s changed with ticket',rec.key);
        ELSE
          out_rec.label_out := FORMAT('%s changed',rec.key);
        END IF;

        RETURN out_rec;
      END IF;
    END IF;
  END LOOP;

  out_rec.applies   := FALSE;
  out_rec.label_out := NULL;
  RETURN out_rec;
END;
$$;

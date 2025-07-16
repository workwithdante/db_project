-- functions/company/is_new.sql

DROP FUNCTION IF EXISTS company.is_new(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.is_new(input_data_csv JSONB, input_data_crm JSONB)
  RETURNS config.rule_out
  LANGUAGE plpgsql STABLE AS $$
DECLARE
  paid_through_date           DATE := company.parse_date_mixed(input_data_csv ->> 'paid_through_date');
  sales_date                  DATE := company.parse_date_mixed(input_data_crm ->> 'sales_date');
  last_day_last_month         DATE := company.last_day_last_month();
  tickets_jsonb               JSONB := COALESCE(
                                          CASE
                                            WHEN jsonb_typeof(input_data_crm -> 'ticket') = 'array'
                                              THEN input_data_crm -> 'ticket'
                                            WHEN jsonb_typeof(input_data_crm -> 'ticket') IS NULL
                                              THEN '[]'::jsonb
                                            ELSE jsonb_build_array(input_data_crm -> 'ticket')
                                          END,
                                          '[]'::jsonb
                                        );
  premium                     NUMERIC := input_data_csv ->> 'premium';
	ticket                      TEXT[] := ARRAY(
                                SELECT jsonb_array_elements_text(tickets_jsonb)
                              );
  out_rec                     config.rule_out;
BEGIN
  out_rec.applies := paid_through_date IS NULL AND sales_date > last_day_last_month;

  IF out_rec.applies AND ticket && ARRAY['PROBLEMA PAGO']
	THEN
    out_rec.label_out := 'New with ticket';
    RETURN out_rec;
  END IF;

  IF out_rec.applies AND NOT (ticket && ARRAY['PAGO'] OR premium = 0)
	THEN
    out_rec.label_out := 'New without paid';
    RETURN out_rec;
  END IF;

  RETURN out_rec;

END;
$$;

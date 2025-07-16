-- functions/company/is_delinquent.sql

DROP FUNCTION IF EXISTS company.is_delinquent(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.is_delinquent(input_data_csv JSONB, input_data_crm JSONB)
  RETURNS config.rule_out
  LANGUAGE plpgsql STABLE AS $$
DECLARE
  paid_through_date DATE := company.parse_date_mixed(input_data_csv ->> 'paid_through_date');
  paid_through_date_crm DATE := company.parse_date_mixed(input_data_crm ->> 'paid_through_date');
  sales_date                  DATE := company.parse_date_mixed(input_data_crm ->> 'sales_date');
  last_day_last_month         DATE := company.last_day_last_month();
  last_day_of_month DATE := company.last_day_curdate();
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
    ticket                      TEXT[] := ARRAY(
		SELECT jsonb_array_elements_text(tickets_jsonb)
	);
  out_rec           config.rule_out;
BEGIN
  out_rec.applies := (paid_through_date IS NULL and sales_date < last_day_last_month)
    OR (paid_through_date < last_day_of_month AND (paid_through_date >= paid_through_date_crm OR paid_through_date_crm IS NULL));

  IF out_rec.applies AND ticket && ARRAY['PROBLEMA PAGO', 'PROBLEMA CAMP', 'PAGO', 'CANCELACIÓN', 'BAJAR DE LA BD']
	THEN
		out_rec.label_out := 'Delinquent with ticket';
	ELSE
    out_rec.label_out := NULL;
  END IF;
  
  RETURN out_rec;
END;
$$;
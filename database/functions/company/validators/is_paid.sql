-- functions/company/is_paid.sql

DROP FUNCTION IF EXISTS company.is_paid(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.is_paid(input_data_csv JSONB, input_data_crm JSONB)
  RETURNS config.rule_out
  LANGUAGE plpgsql STABLE AS $$
DECLARE
  paid_through_date       DATE := company.parse_date_mixed(input_data_csv ->> 'paid_through_date');
  paid_through_date_crm   DATE := company.parse_date_mixed(input_data_crm ->> 'paid_through_date');
  last_day_of_month       DATE := company.last_day_curdate();
  out_rec                 config.rule_out;
BEGIN
  out_rec.applies := paid_through_date >= last_day_of_month AND paid_through_date = paid_through_date_crm;
  
  out_rec.label_out := NULL;

  IF company.is_wrong_tipific(input_data_crm) THEN
    out_rec.label_out := 'Paid With Ticket';
  END IF;
  RETURN out_rec;
END;
$$;

-- functions/company/molina/get_status.sql

DROP FUNCTION IF EXISTS molina.get_status(JSONB, JSONB);

CREATE OR REPLACE FUNCTION molina.get_status(input_data_csv JSONB, input_data_crm JSONB)
RETURNS TABLE(status TEXT, new_clean_input_data_csv JSONB) AS $$
BEGIN

    new_clean_input_data_csv :=  jsonb_strip_nulls(input_data_csv);

    status := company.evaluate_status(new_clean_input_data_csv, input_data_crm);
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql STABLE;

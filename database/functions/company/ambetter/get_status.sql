-- functions/company/ambetter/get_status.sql

DROP FUNCTION IF EXISTS ambetter.get_status(JSONB, JSONB);

CREATE OR REPLACE FUNCTION ambetter.get_status(
    input_data_csv JSONB,
    input_data_crm JSONB
)
RETURNS TABLE(
    status TEXT,
    new_clean_input_data_csv JSONB
) LANGUAGE plpgsql STABLE AS $$
DECLARE
    payment_type       TEXT := input_data_csv->>'payment_type';
    new_input_data_csv JSONB;
BEGIN
    IF payment_type = 'Y' THEN
        new_input_data_csv := input_data_csv 
                          || jsonb_build_object('payment_type', 'YES');
    ELSE
        new_input_data_csv := input_data_csv 
                          || jsonb_build_object('payment_type', NULL);
    END IF;

    new_clean_input_data_csv := jsonb_strip_nulls(new_input_data_csv);

    status := company.evaluate_status(
        new_clean_input_data_csv,
        input_data_crm
    );
    RETURN NEXT;
END;
$$;

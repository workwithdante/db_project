-- functions/company/oscar/get_status.sql


DROP FUNCTION IF EXISTS oscar.get_status(JSONB, JSONB);

CREATE OR REPLACE FUNCTION oscar.get_status(input_data_csv JSONB, input_data_crm JSONB)
RETURNS TABLE(status TEXT, new_clean_input_data_csv JSONB) AS $$
DECLARE
    payment_type                TEXT := input_data_csv->>'payment_type';
    policy_status                TEXT := input_data_csv->>'policy_status';
    new_input_data_csv          JSONB;
BEGIN

    IF payment_type = 'ON' THEN
        new_input_data_csv := input_data_csv || jsonb_build_object('payment_type', 'YES');
    ELSE
        new_input_data_csv := input_data_csv || jsonb_build_object('payment_type', null);
    END IF;

    new_clean_input_data_csv :=  jsonb_strip_nulls(new_input_data_csv);

    status := company.evaluate_status(new_clean_input_data_csv, input_data_crm);

    IF status = 'Bounce' AND policy_status = 'Active' THEN
        status := 'Paid';
    END IF;
    RETURN NEXT;
END;
$$ LANGUAGE plpgsql STABLE;
-- functions/company/build_args_crm.sql

DROP FUNCTION IF EXISTS company.build_args_crm();

CREATE OR REPLACE FUNCTION company.build_args_crm()
RETURNS TEXT
LANGUAGE plpgsql
IMMUTABLE AS $$
DECLARE
    args_data TEXT;
BEGIN
    SELECT string_agg(
        '''' || field_name || ''', data.' || field_name,
        ', '
        ORDER BY id
    )
    INTO args_data
    FROM config.fields
    WHERE mandatory = TRUE;

    RETURN args_data;
END;
$$;

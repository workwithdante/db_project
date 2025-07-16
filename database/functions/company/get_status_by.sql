-- functions/company/get_status_by.sql

DROP FUNCTION IF EXISTS company.get_status_by(TEXT, INT, TEXT, TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION company.get_status_by(
    p_company      TEXT,
    p_broker       INT,
    batch_name     TEXT,
    process_date   TIMESTAMPTZ
)
RETURNS TABLE(status text, crm jsonb, csv jsonb)
LANGUAGE plpgsql
VOLATILE AS $$
DECLARE
    v_dispatcher_id INT;
    json_args_csv   TEXT;
    json_args_crm   TEXT;
    p_tbl           TEXT;
    join_col        TEXT;
    status_col      TEXT;
    join_sql        TEXT;
    condition_sql   TEXT;
    p_company_code  TEXT := lower(p_company);
    p_broker_name   TEXT;
BEGIN
    -- Validar parámetros
    IF p_company_code IS NULL OR p_broker IS NULL THEN
        RETURN;
    END IF;

    -- Obtener dispatcher_id, tabla y broker_name
    SELECT csd.id, csd.tbl, bi.name
      INTO v_dispatcher_id, p_tbl, p_broker_name
    FROM config.dispatcher csd
    JOIN company.broker_info bi ON bi.id = csd.broker_id
    WHERE csd.company = p_company_code
      AND bi.npn       = p_broker
    LIMIT 1;

    IF v_dispatcher_id IS NULL THEN
        RETURN;
    END IF;

    -- Construir argumentos para CRM y CSV
    json_args_crm := company.build_args_crm();
    json_args_csv := company.build_args_csv(v_dispatcher_id);

    -- Columnas dinámicas
    SELECT inf.column_name INTO join_col
      FROM config.input_field inf
      JOIN config.fields f ON f.id = inf.field_id
     WHERE inf.dispatcher_id = v_dispatcher_id
       AND f.field_name     = 'member_id'
     LIMIT 1;

    SELECT inf.column_name INTO status_col
      FROM config.input_field inf
      JOIN config.fields f ON f.id = inf.field_id
     WHERE inf.dispatcher_id = v_dispatcher_id
       AND f.field_name     = 'policy_status'
     LIMIT 1;

    -- Construir JOIN dinámico
    IF p_company_code IN ('molina','aetna') THEN
      join_sql := format('company.%I = data.member_id', join_col);
    ELSE
      join_sql := format('company.member_id_match(company.%I, data.member_id)', join_col);
    END IF;

    join_sql := join_sql || format(
      ' AND data.company = %L AND data.broker = %L',
      initcap(p_company), upper(p_broker_name)
    );

    -- Condición dinámica de filtro
    condition_sql := format(
      '(
         data.company = %L AND data.broker = %L
       ) OR (
         data.company IS NULL AND company.%I <> %L
       )',
      initcap(p_company), upper(p_broker_name), status_col, 'Inactive'
    );

    -- Construir y ejecutar la consulta
    RETURN QUERY EXECUTE company.build_query(
      p_company_code,
      p_broker,
      join_sql,
      json_args_crm,
      json_args_csv,
      condition_sql,
      batch_name,
      process_date,
      p_tbl
    )
    WHERE status = 'Update';
END;
$$;

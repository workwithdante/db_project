-- functions/company/build_args_csv.sql

DROP FUNCTION IF EXISTS company.build_args_csv(INT);

CREATE OR REPLACE FUNCTION company.build_args_csv(
    p_dispatcher_id INT
) RETURNS TEXT
LANGUAGE plpgsql
IMMUTABLE AS $$
DECLARE
    args_company TEXT;
    v_schema     TEXT;
    v_table      TEXT;
BEGIN
    -- Obtener el esquema y tabla dinámicamente
    SELECT csd.company, csd.tbl
      INTO v_schema, v_table
    FROM config.dispatcher csd
    WHERE csd.id = p_dispatcher_id;

    IF v_schema IS NULL THEN
        RETURN NULL;
    END IF;

    SELECT string_agg(
        CASE 
            WHEN c.data_type IN (
                'date', 
                'timestamp', 
                'timestamp without time zone', 
                'timestamp with time zone', 
                'character varying', 
                'text'
              ) 
              AND f.field_name ~* 'date' THEN
                format('%L, TO_CHAR(%I.%I::date, ''YYYY-MM-DD'')', 
                       f.field_name, v_schema, si.column_name)

            WHEN c.data_type IN ('character varying','text') 
                 AND f.field_name ~* 'premium' THEN
                format(
                  '%L, COALESCE(' ||
                  'CASE ' ||
                    'WHEN %I.%I ~ ''^\$'' THEN CAST(regexp_replace(%I.%I, ''^\$'', '''', ''g'') AS NUMERIC) ' ||
                    'WHEN %I.%I IS NULL THEN NULL ' ||
                    'ELSE %I.%I::NUMERIC END, NULL)',
                  f.field_name,
                  v_schema, si.column_name,   -- remove leading $
                  si.column_name, si.column_name,
                  v_schema, si.column_name,
                  v_schema, si.column_name
                )

            WHEN c.data_type IN ('integer','bigint','smallint') THEN 
                format('%L, COALESCE(%I.%I, 0)', 
                       f.field_name, v_schema, si.column_name)

            ELSE 
                format('%L, %I.%I', 
                       f.field_name, v_schema, si.column_name)
        END,
        ', '
    )
    INTO args_company
    FROM config.input_field AS si
    JOIN config.fields         AS f ON si.field_id   = f.id
    JOIN information_schema.columns AS c
      ON c.table_schema = v_schema
     AND c.table_name  = v_table
     AND c.column_name = si.column_name
    WHERE si.dispatcher_id = p_dispatcher_id;

    RETURN args_company;
END;
$$;

-- functions/company/build_query.sql

DROP FUNCTION IF EXISTS company.build_query(TEXT, INT, TEXT, TEXT, TEXT, TEXT, TEXT, TIMESTAMPTZ, TEXT);

CREATE OR REPLACE FUNCTION company.build_query(
    p_company_code      TEXT,
    p_broker_code       INT,
    join_sql            TEXT,
    p_args_crm          TEXT,
    p_args_csv          TEXT,
    condition_sql       TEXT,
    p_batch_name        TEXT,
    p_process_date      TIMESTAMPTZ,
    tbl_temp            TEXT    
) RETURNS TEXT
LANGUAGE plpgsql
VOLATILE AS $$
DECLARE
  dyn_sql TEXT;
BEGIN
  dyn_sql := format(
    $SQL$
      WITH fin AS (
        SELECT
          st.status,
          crm.row_json AS crm,
          csv.row_json AS csv
        FROM vtigercrm_2022.contacts_monitored AS data

        FULL OUTER JOIN %1$I.%9$I AS company
          ON %3$s

        CROSS JOIN LATERAL (
          SELECT nullif(
            jsonb_strip_nulls(jsonb_build_object(%4$s)),
            '{}'::jsonb
          ) AS row_json
        ) AS crm

        CROSS JOIN LATERAL (
          SELECT nullif(
            jsonb_strip_nulls(jsonb_build_object(%5$s)),
            '{}'::jsonb
          ) AS row_json
        ) AS csv

        LEFT JOIN LATERAL (
          SELECT * FROM %1$I.get_status(csv.row_json, crm.row_json)
        ) AS st ON TRUE

        WHERE %6$s
      )
      INSERT INTO company.status_results (
        process_date,
        batch_name,
        company,
        broker,
        status,
        crm_data,
        csv_data
      )
      SELECT
        %7$L,
        %8$L,
        %1$L,
        %2$L,
        status,
        crm,
        csv
      FROM fin
      RETURNING status, crm_data AS crm, csv_data AS csv;
    $SQL$,
    p_company_code,
    p_broker_code,
    join_sql,
    p_args_crm,
    p_args_csv,
    condition_sql,
    p_process_date,
    p_batch_name,
    tbl_temp
  );

  RETURN dyn_sql;
END;
$$;

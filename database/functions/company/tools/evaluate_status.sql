-- functions/company/evaluate_status.sql

DROP FUNCTION IF EXISTS company.evaluate_status(JSONB, JSONB);

CREATE OR REPLACE FUNCTION company.evaluate_status(
    input_data_csv JSONB,
    input_data_crm JSONB
)
RETURNS TEXT
LANGUAGE plpgsql
STABLE AS $$
DECLARE
  rule      RECORD;
  fn_schema TEXT;
  fn_name   TEXT;
  fqfn      TEXT;
  r_out     config.rule_out;
BEGIN
  FOR rule IN
    SELECT rule_fn, result_label
      FROM config.rules
    ORDER BY priority
  LOOP
    -- Obtiene schema y nombre real de la función
    SELECT n.nspname, p.proname
      INTO fn_schema, fn_name
    FROM pg_proc p
    JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE p.oid = rule.rule_fn;

    -- Construye el nombre calificado
    fqfn := quote_ident(fn_schema) || '.' || quote_ident(fn_name);

    -- Ejecuta dinámicamente la función
    EXECUTE format(
      'SELECT * FROM %s($1::jsonb, $2::jsonb)',
      fqfn
    )
    INTO r_out
    USING input_data_csv, input_data_crm;

    IF r_out.applies THEN
      RETURN COALESCE(r_out.label_out, rule.result_label);
    END IF;
  END LOOP;

  RETURN 'Unknown';
END;
$$;

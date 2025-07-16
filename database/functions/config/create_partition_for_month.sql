-- functions/config/create_partition_for_month.sql

CREATE OR REPLACE FUNCTION config.create_partition_for_month(p_dt date)
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  start_ts  timestamp := date_trunc('month', p_dt);
  end_ts    timestamp := start_ts + INTERVAL '1 month';
  suffix    text      := to_char(start_ts, 'YYYY_MM');
BEGIN
  EXECUTE format(
    $sql$
    CREATE TABLE IF NOT EXISTS %I.%I
      PARTITION OF %I.%I
      FOR VALUES FROM (%L) TO (%L)
    $sql$,
    'company',                              -- esquema de la partición
    'status_results_' || suffix,           -- nombre de la partición
    'company',                              -- esquema de la tabla padre
    'status_results',                       -- tabla padre
    start_ts,                               -- bound FROM
    end_ts                                  -- bound TO
  );
END;
$$;

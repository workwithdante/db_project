-- setup/04_cron_jobs/2025-07-16_112000_schedule_partition_job.sql

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN

    -- Desprograma si ya existe
    IF EXISTS (SELECT 1 FROM cron.job WHERE jobname = 'create_next_month_partition') THEN
      PERFORM cron.unschedule('create_next_month_partition');
    END IF;

    -- Programa (o reprograma) el job diario a medianoche
    PERFORM cron.schedule(
      'create_next_month_partition',
      '0 0 * * *',
      $job$
      DO
      BEGIN
        -- date_trunc('month', now()) arroja el primer día de este mes
        PERFORM config.create_partition_for_month(
          date_trunc('month', now())::date
        );
      END;
      $job$
    );

    -- Y aquí, inmediatamente, crea la partición del mes actual
    PERFORM config.create_partition_for_month(now()::date);

  ELSE
    RAISE NOTICE 'pg_cron no está instalado; usa cron del SO o pgAgent';
  END IF;
END;
$$;

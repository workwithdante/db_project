-- setup/04_cron_jobs/2025-07-16_111500_schedule_cron_jobs.sql

DO $$
BEGIN
  -- Solo si la extensión pg_cron está instalada
  IF EXISTS (SELECT 1 FROM pg_extension WHERE extname = 'pg_cron') THEN

    -- Intenta desprogramar los jobs anteriores si existieran
    BEGIN
      IF EXISTS (SELECT 1 FROM cron.job WHERE jobname = 'refresh_contact_active_annual_10min') THEN
        PERFORM cron.unschedule('refresh_contact_active_annual_10min');
      END IF;

      IF EXISTS (SELECT 1 FROM cron.job WHERE jobname = 'refresh_ticket_active_annual_5min') THEN
        PERFORM cron.unschedule('refresh_ticket_active_annual_5min');
      END IF;
    EXCEPTION WHEN OTHERS THEN
      -- Ignora errores (p. ej. si el job no existía)
      RAISE NOTICE 'Ignoring error while unscheduling: %', SQLERRM;
    END;

    -- Programa el refresco cada 10 minutos
    PERFORM cron.schedule(
      'refresh_contact_active_annual_10min',
      '*/10 * * * *',
      'REFRESH MATERIALIZED VIEW vtigercrm_2022.contact_active_annual;'
    );

    -- Programa el refresco cada 5 minutos
    PERFORM cron.schedule(
      'refresh_ticket_active_annual_5min',
      '*/5 * * * *',
      'REFRESH MATERIALIZED VIEW vtigercrm_2022.ticket_active_annual;'
    );

  ELSE
    RAISE NOTICE 'pg_cron not enabled; manual or OS cron required';
  END IF;
END
$$;

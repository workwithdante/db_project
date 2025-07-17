-- Asegura que exista el schema
CREATE SCHEMA IF NOT EXISTS vtigercrm_2022;

-- Instala la extensión dentro de vtigercrm_2022
CREATE EXTENSION IF NOT EXISTS mysql_fdw
  SCHEMA vtigercrm_2022;
  
-- 2. Crea el FDW server sólo si no existe, usando un bloque dinámico
DO $$
DECLARE
  _host text := current_setting('FDW_HOST', true);
  _port text := current_setting('FDW_PORT', true);
BEGIN
  IF NOT EXISTS (
    SELECT 1
      FROM pg_foreign_server
     WHERE srvname = 'mariadb_srv'
  ) THEN
    -- forzamos que Postgres busque el wrapper en vtigercrm_2022
    EXECUTE format($fmt$
      CREATE SERVER mariadb_srv
        FOREIGN DATA WRAPPER vtigercrm_2022.mysql_fdw
        OPTIONS (
          host %L,
          port %L
        )
      $fmt$,
      _host, _port
    );
  END IF;
END
$$;

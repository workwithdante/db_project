-- setup/03_load_functions/20250716122000_load_functions.sql
-- Orquesta la carga de todas las funciones PL/pgSQL en el orden deseado

BEGIN;

\i ../../functions/ambetter/get_status.sql
\i ../../functions/oscar/get_status.sql
\i ../../functions/molina/get_status.sql
\i ../../functions/aetna/get_status.sql

COMMIT;

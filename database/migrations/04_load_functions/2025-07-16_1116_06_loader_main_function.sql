-- setup/03_load_functions/20250716122000_load_functions.sql
-- Orquesta la carga de todas las funciones PL/pgSQL en el orden deseado

BEGIN;

\i ../../functions/company/get_status_by.sql

COMMIT;

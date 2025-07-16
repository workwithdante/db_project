-- setup/03_load_functions/20250716122000_load_functions.sql
-- Orquesta la carga de todas las funciones PL/pgSQL en el orden deseado

BEGIN;

\i ../../functions/utils/date/ensure_date.sql
\i ../../functions/utils/date/parse_date_mixed.sql
\i ../../functions/utils/date/last_day_curdate.sql
\i ../../functions/utils/date/last_day_curyear.sql
\i ../../functions/utils/date/last_day_last_year.sql
\i ../../functions/utils/date/last_day_last_month.sql
\i ../../functions/utils/date/last_day_two_last_month.sql

COMMIT;

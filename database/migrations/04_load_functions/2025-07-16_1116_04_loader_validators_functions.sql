-- setup/03_load_functions/20250716122000_load_functions.sql
-- Orquesta la carga de todas las funciones PL/pgSQL en el orden deseado

BEGIN;

\i ../../functions/company/validators/doesnt_exists_member_id.sql
\i ../../functions/company/validators/doesnt_exists_so_no.sql
\i ../../functions/company/validators/is_bounce.sql
\i ../../functions/company/validators/is_delinquent.sql
\i ../../functions/company/validators/is_new.sql
\i ../../functions/company/validators/is_paid.sql
\i ../../functions/company/validators/is_update.sql

COMMIT;

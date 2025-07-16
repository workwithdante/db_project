-- setup/03_load_functions/20250716122000_load_functions.sql
-- Orquesta la carga de todas las funciones PL/pgSQL en el orden deseado

BEGIN;

\i ../../functions/company/tools/normalize_member_id.sql
\i ../../functions/company/tools/member_id_match.sql
\i ../../functions/company/tools/broker_code.sql
\i ../../functions/company/tools/get_tickets.sql
\i ../../functions/company/tools/compare_json.sql
\i ../../functions/company/tools/build_args_csv.sql
\i ../../functions/company/tools/build_args_crm.sql
\i ../../functions/company/tools/build_query.sql
\i ../../functions/company/tools/evaluate_status.sql

COMMIT;

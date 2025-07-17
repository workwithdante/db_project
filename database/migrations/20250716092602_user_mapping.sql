CREATE EXTENSION IF NOT EXISTS mysql_fdw;

CREATE SERVER mariadb_srv
  FOREIGN DATA WRAPPER mysql_fdw
  OPTIONS (
    host '${FDW_HOST}',
    port '${FDW_PORT}'
  );

CREATE USER MAPPING FOR postgres
  SERVER mariadb_srv
  OPTIONS (
    username '${FDW_USER}',
    password '${FDW_PASS}'
  );

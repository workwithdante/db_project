CREATE SERVER mariadb_srv
  FOREIGN DATA WRAPPER mysql_fdw
  OPTIONS (
    host '${FDW_HOST}',
    port '${FDW_PORT}'
  );

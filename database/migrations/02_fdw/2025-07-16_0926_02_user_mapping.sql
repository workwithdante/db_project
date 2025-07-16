-- 3) Crear el mapeo de usuario para “demo”
CREATE USER MAPPING FOR postgres
  SERVER mariadb_srv
  OPTIONS (
    username '${FDW_USER}',
    password '${FDW_PASS}'
  );

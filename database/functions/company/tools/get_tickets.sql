-- functions/company/get_tickets.sql

DROP FUNCTION IF EXISTS company.get_tickets(TEXT);

CREATE OR REPLACE FUNCTION company.get_tickets(input_data_crm JSONB)
  RETURNS TEXT[]
  LANGUAGE sql STABLE AS
$$
  SELECT COALESCE(
    ARRAY(
      WITH RECURSIVE
        arr(node) AS (
          -- semilla: el JSON bajo “ticket” (puede ser array, scalar o NULL)
          SELECT input_data_crm -> 'ticket'
        UNION ALL
          -- si es array, desmenúzalo
          SELECT jsonb_array_elements(node)
          FROM arr
          WHERE jsonb_typeof(node) = 'array'
        )
      -- quedarnos solo con los nodos que ya no son arrays (i.e. escalares)
      SELECT node #>> '{}' AS txt
      FROM arr
      WHERE jsonb_typeof(node) <> 'array'
    ),
    '{}'  -- fallback a array vacío si no hay nada
  );
$$;

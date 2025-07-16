-- functions/company/broker_code.sql

DROP FUNCTION IF EXISTS company.broker_code(TEXT);

CREATE OR REPLACE FUNCTION company.broker_code(broker TEXT)
  RETURNS TEXT
  LANGUAGE SQL
  IMMUTABLE
AS $$
  SELECT lower(
    string_agg(
      substr(word,1,1),    -- primera letra de cada palabra
      ''                   -- sin separador
      ORDER BY idx         -- mantener el orden original
    )
  )
  FROM unnest(string_to_array(broker, ' ')) WITH ORDINALITY AS t(word, idx);
$$;

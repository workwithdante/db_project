-- setup/05_seeds/2025-07-16_1000_seed_broker_info.sql

-- Inserta o actualiza brokers base
INSERT INTO company.broker_info (name, npn)
SELECT name, npn
FROM (
  VALUES
    ('Beatriz Sierra',       8602276),
    ('Ana Daniella Corrales',19011307)
) AS vals(name, npn)
ON CONFLICT (npn)
  DO UPDATE SET
    name = EXCLUDED.name;

-- setup/05_seeds/2025-07-16_1015_seed_dispatcher.sql

SET search_path = config, company;

-- Inserta o ignora duplicados en config.dispatcher
INSERT INTO config.dispatcher (company, broker_id, tbl)
SELECT
  vals.company,
  bi.id,
  vals.tbl
FROM (
  VALUES
    ('oscar',    8602276, 'bs'),
    ('oscar',    19011307, 'adc'),
    ('aetna',    8602276, 'bs'),
    ('molina',   8602276, 'bs'),
    ('ambetter', 8602276, 'bs'),
    ('ambetter', 19011307, 'adc')
) AS vals(company, broker_code, tbl)
JOIN company.broker_info AS bi
  ON bi.npn = vals.broker_code
ON CONFLICT (company, broker_id) DO NOTHING;

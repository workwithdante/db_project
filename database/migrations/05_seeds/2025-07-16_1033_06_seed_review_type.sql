-- setup/05_seeds/2025-07-16_1055_seed_review_type.sql
SET search_path = company;

INSERT INTO company.review_type (name, error)
SELECT name, error
FROM (
  VALUES
    ('Create Issue', FALSE),
    ('Portal Error',  FALSE),
    ('Sync Error',    TRUE),
    ('Paid',          FALSE),
    ('Check',         FALSE),
    ('Life Change',   FALSE)
) AS vals(name, error)
ON CONFLICT (name)
  DO UPDATE SET error = EXCLUDED.error;

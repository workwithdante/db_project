-- setup/05_seeds/2025-07-16_1045_seed_status_type.sql
SET search_path = company;

INSERT INTO company.status_type (name, error)
SELECT name, error
FROM (
  VALUES
    ('New',                                        FALSE),
    ('New without ticket',                         TRUE),
    ('New with ticket',                            FALSE),
    ('New without paid',                           TRUE),
    ('Bounce',                                     TRUE),
    ('Bounce with ticket',                         FALSE),
    ('termination_date changed',                   TRUE),
    ('termination_date changed with ticket',       FALSE),
    ('termination_partial_date changed with ticket',FALSE),
    ('termination_partial_date changed',           TRUE),
    ('Doesnt exist in crm',                        TRUE),
    ('Doesnt exist in csv',                        TRUE),
    ('Doesnt exist in csv with paid',              FALSE),
    ('Doesnt exist in csv with problems',          FALSE),
    ('effective_date changed',                     TRUE),
    ('effective_date changed with ticket',         FALSE),
    ('premium changed',                            TRUE),
    ('premium changed with ticket',                FALSE),
    ('Delinquent',                                 TRUE),
    ('Delinquent with ticket',                     FALSE),
    ('Update',                                     FALSE),
    ('payment_type changed',                       TRUE),
    ('Paid',                                       FALSE),
    ('Update With Ticket',                         TRUE),
    ('Paid With Ticket',                           TRUE),
    ('Unknown',                                    TRUE)
) AS vals(name, error)
ON CONFLICT (name)
  DO UPDATE SET error = EXCLUDED.error;

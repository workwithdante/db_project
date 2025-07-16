-- setup/05_seeds/2025-07-16_1030_seed_input_field.sql
SET search_path = config, company;

WITH vals AS (
  VALUES
    -- ambetter - bs
    ('ambetter', 'Beatriz Sierra',       'policy_status',             'policy_status'),
    ('ambetter', 'Beatriz Sierra',       'member_id',                 'Policy Number'),
    ('ambetter', 'Beatriz Sierra',       'termination_date',          'Policy Term Date'),
    ('ambetter', 'Beatriz Sierra',       'premium',                   'Member Responsibility'),
    ('ambetter', 'Beatriz Sierra',       'broker_end_date',           'Broker Term Date'),
    ('ambetter', 'Beatriz Sierra',       'initial_date',              'Policy Effective Date'),
    ('ambetter', 'Beatriz Sierra',       'paid_through_date',         'Paid Through Date'),
    ('ambetter', 'Beatriz Sierra',       'payment_type',              'Autopay'),

    -- ambetter - adc
    ('ambetter', 'Ana Daniella Corrales','policy_status',             'policy_status'),
    ('ambetter', 'Ana Daniella Corrales','member_id',                 'Policy Number'),
    ('ambetter', 'Ana Daniella Corrales','termination_date',          'Policy Term Date'),
    ('ambetter', 'Ana Daniella Corrales','premium',                   'Member Responsibility'),
    ('ambetter', 'Ana Daniella Corrales','broker_termination_date',   'Broker Term Date'),
    ('ambetter', 'Ana Daniella Corrales','initial_date',              'Policy Effective Date'),
    ('ambetter', 'Ana Daniella Corrales','paid_through_date',         'Paid Through Date'),
    ('ambetter', 'Ana Daniella Corrales','payment_type',              'Autopay'),

    -- oscar - bs
    ('oscar',    'Beatriz Sierra',       'policy_status',             'Policy status'),
    ('oscar',    'Beatriz Sierra',       'member_id',                 'Member ID'),
    ('oscar',    'Beatriz Sierra',       'termination_partial_date',  'Coverage end date'),
    ('oscar',    'Beatriz Sierra',       'premium',                   'Premium amount'),
    ('oscar',    'Beatriz Sierra',       'effective_partial_date',    'Coverage start date'),
    ('oscar',    'Beatriz Sierra',       'paid_through_date',         'paid_through_date'),
    ('oscar',    'Beatriz Sierra',       'payment_type',              'Autopay'),

    -- oscar - adc
    ('oscar',    'Ana Daniella Corrales','policy_status',             'Policy status'),
    ('oscar',    'Ana Daniella Corrales','member_id',                 'Member ID'),
    ('oscar',    'Ana Daniella Corrales','termination_partial_date',  'Coverage end date'),
    ('oscar',    'Ana Daniella Corrales','premium',                   'Premium amount'),
    ('oscar',    'Ana Daniella Corrales','effective_partial_date',    'Coverage start date'),
    ('oscar',    'Ana Daniella Corrales','paid_through_date',         'paid_through_date'),
    ('oscar',    'Ana Daniella Corrales','payment_type',              'Autopay'),

    -- molina - bs
    ('molina',   'Beatriz Sierra',       'policy_status',             'policy_status'),
    ('molina',   'Beatriz Sierra',       'member_id',                 'HIX_ID'),
    ('molina',   'Beatriz Sierra',       'termination_date',          'End_Date'),
    ('molina',   'Beatriz Sierra',       'premium',                   'Member_Premium'),
    ('molina',   'Beatriz Sierra',       'broker_termination_date',   'Broker_End_Date'),
    ('molina',   'Beatriz Sierra',       'initial_date',              'Effective_date'),
    ('molina',   'Beatriz Sierra',       'paid_through_date',         'Paid_Through_Date'),

    -- aetna - bs
    ('aetna',    'Beatriz Sierra',       'policy_status',             'Financial Status'),
    ('aetna',    'Beatriz Sierra',       'member_id',                 'Issuer Assigned ID'),
    ('aetna',    'Beatriz Sierra',       'paid_through_date',         'Paid Through Date'),
    ('aetna',    'Beatriz Sierra',       'effective_partial_date',    'Effective Date')
)
INSERT INTO config.input_field(dispatcher_id, field_id, column_name)
SELECT
  d.id,
  f.id,
  v.column_name
FROM vals AS v(company, broker_name, field_name, column_name)
JOIN config.fields         AS f ON f.field_name = v.field_name
JOIN config.dispatcher     AS d ON d.company = v.company
JOIN company.broker_info   AS b ON b.id = d.broker_id AND b.name = v.broker_name
ON CONFLICT (dispatcher_id, field_id) DO UPDATE
  SET column_name = EXCLUDED.column_name;

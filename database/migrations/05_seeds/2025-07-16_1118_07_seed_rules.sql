-- setup/05_seeds/2025-07-16_120000_seed_rules.sql
SET search_path = config;

INSERT INTO config.rules (rule_fn, result_label, priority)
VALUES
  ('company.doesnt_exists_member_id(jsonb,jsonb)'::regprocedure, 'Doesnt exist in csv',    10),
  ('company.doesnt_exists_so_no(jsonb,jsonb)'::regprocedure,   'Doesnt exist in crm',    10),
  ('company.compare_json_keys(jsonb,jsonb)'::regprocedure,     'Something change',       20),
  ('company.is_bounce(jsonb,jsonb)'::regprocedure,             'Bounce',                 30),
  ('company.is_delinquent(jsonb,jsonb)'::regprocedure,        'Delinquent',             40),
  ('company.is_update(jsonb,jsonb)'::regprocedure,            'Update',                 50),
  ('company.is_paid(jsonb,jsonb)'::regprocedure,              'Paid',                   60),
  ('company.is_new(jsonb,jsonb)'::regprocedure,               'New',                    70)
ON CONFLICT (rule_fn)
  DO UPDATE SET priority = EXCLUDED.priority;

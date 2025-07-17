-- setup/05_seeds/2025-07-16_1025_seed_fields.sql

-- Rellenar o actualizar campos en config.fields
INSERT INTO config.fields (field_name, mandatory) VALUES
  ('so_no',                   TRUE),
  ('problem',                 TRUE),
  ('typing_date',             TRUE),
  ('effective_date',          TRUE),
  ('effective_partial_date',  TRUE),
  ('sales_date',              TRUE),
  ('ticket',                  TRUE),
  ('payday',                  TRUE),
  ('member_id',               FALSE),
  ('payment_type',             TRUE),
  ('policy_status',           FALSE),
  ('termination_date',         TRUE),
  ('premium',                  TRUE),
  ('termination_partial_date', TRUE),
  ('paid_through_date',        TRUE),
  ('broker_effective_date',   FALSE),
  ('broker_termination_date', FALSE),
  ('broker_end_date',          FALSE),
  ('initial_date',             FALSE),
  ('next_premium',             TRUE)
ON CONFLICT (field_name)
  DO UPDATE SET mandatory = EXCLUDED.mandatory;

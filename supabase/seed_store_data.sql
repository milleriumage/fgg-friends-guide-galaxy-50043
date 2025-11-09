-- Seed data for store (credit packages and subscription plans)

-- Insert credit packages
INSERT INTO public.credit_packages (id, credits, price, bonus, best_value, stripe_product_id)
VALUES 
  ('pkg1', 200, 2.00, 0, false, 'prod_SyYasByos1peGR'),
  ('pkg2', 500, 5.00, 0, false, 'prod_SyYeStqRDuWGFF'),
  ('pkg3', 1000, 10.00, 0, false, 'prod_SyYfzJ1fjz9zb9'),
  ('pkg4', 2500, 25.00, 0, true, 'prod_SyYmVrUetdiIBY'),
  ('pkg5', 5000, 50.00, 0, false, 'prod_SyYg54VfiOr7LQ'),
  ('pkg6', 10000, 100.00, 0, false, 'prod_SyYhva8A2beAw6')
ON CONFLICT (id) DO UPDATE SET
  credits = EXCLUDED.credits,
  price = EXCLUDED.price,
  bonus = EXCLUDED.bonus,
  best_value = EXCLUDED.best_value,
  stripe_product_id = EXCLUDED.stripe_product_id;

-- Insert subscription plans
INSERT INTO public.subscription_plans (id, name, price, currency, credits, features, stripe_product_id)
VALUES 
  ('plan_free', 'Free', 0, 'USD', 0, ARRAY['Access to public content', 'Follow creators'], 'prod_SyYChoQJbIb1ye'),
  ('plan_basic', 'Basic', 9.00, 'USD', 1000, ARRAY['Access to exclusive content', 'Monthly credit top-up', 'Basic creator support'], 'prod_SyYK31lYwaraZW'),
  ('plan_pro', 'Pro', 15.00, 'USD', 2000, ARRAY['All Basic features', 'Early access to new content', 'Priority creator support'], 'prod_SyYMs3lMIhORSP'),
  ('plan_vip', 'VIP', 25.00, 'USD', 4000, ARRAY['All Pro features', 'Direct message with creators', 'Exclusive VIP badge'], 'prod_SyYVIP')
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  price = EXCLUDED.price,
  currency = EXCLUDED.currency,
  credits = EXCLUDED.credits,
  features = EXCLUDED.features,
  stripe_product_id = EXCLUDED.stripe_product_id;

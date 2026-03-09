-- Fix: Add RLS policies for the 'authenticated' role.
-- When users sign in via Supabase Auth (email/password), the client uses
-- the 'authenticated' role instead of 'anon'. The original schema only
-- granted access to 'anon' (designed for MSAL-only auth), so authenticated
-- users got zero results from all table queries — appearing as "no data".

CREATE POLICY users_authenticated ON users FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY companies_authenticated ON companies FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY contacts_authenticated ON contacts FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY settings_authenticated ON user_settings FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY scan_authenticated ON scan_metadata FOR ALL TO authenticated USING (true) WITH CHECK (true);

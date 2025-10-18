SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict bRyn4yYrel5TlXrslr7LyDbCfgjnDykG9r5dieXNq2NdKGFaqsiXxfne9DxtkXg

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '81737037-9c66-4680-b74e-c34580202bd7', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"bala@gmail.com","user_id":"be31276f-f1b7-4b95-b498-92158d2b2095","user_phone":""}}', '2025-10-18 12:38:59.357764+00', ''),
	('00000000-0000-0000-0000-000000000000', '715e56bd-f898-40e3-b37b-886c5da445c2', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"provider":"email","user_email":"kola@gmail.com","user_id":"72cf2a1c-b2a4-415e-841b-8c7c3eb01cab","user_phone":""}}', '2025-10-18 12:39:23.62163+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd46f161-2ff9-40e2-8550-6c0f71e68833', '{"action":"user_invited","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"hakeem@gmail.com","user_id":"4968e983-0d9d-4f97-b70d-2426431a3ab8"}}', '2025-10-18 12:39:41.503229+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'be31276f-f1b7-4b95-b498-92158d2b2095', 'authenticated', 'authenticated', 'bala@gmail.com', '$2a$10$D68bXhT8St4r5JiAZ6MUle2kBW2g/CegSKvWh8kXkiScw0myEUvFu', '2025-10-18 12:38:59.36697+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2025-10-18 12:38:59.346534+00', '2025-10-18 12:38:59.367981+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '72cf2a1c-b2a4-415e-841b-8c7c3eb01cab', 'authenticated', 'authenticated', 'kola@gmail.com', '$2a$10$oElRhPMCLQStsuLxlZArmOs6m/ByKcJeWlVZj3OCfgJNPDSzy04EK', '2025-10-18 12:39:23.62288+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2025-10-18 12:39:23.618801+00', '2025-10-18 12:39:23.623663+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '4968e983-0d9d-4f97-b70d-2426431a3ab8', 'authenticated', 'authenticated', 'hakeem@gmail.com', '', NULL, '2025-10-18 12:39:41.504353+00', '730abf1948d5127ecf9dddfe8b4ce572c70b0a4a2c97f8678ab0693e', '2025-10-18 12:39:41.504353+00', '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2025-10-18 12:39:41.498285+00', '2025-10-18 12:39:41.831504+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('be31276f-f1b7-4b95-b498-92158d2b2095', 'be31276f-f1b7-4b95-b498-92158d2b2095', '{"sub": "be31276f-f1b7-4b95-b498-92158d2b2095", "email": "bala@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2025-10-18 12:38:59.355127+00', '2025-10-18 12:38:59.355188+00', '2025-10-18 12:38:59.355188+00', 'd9fee300-0b34-4dc5-8194-32787509ca16'),
	('72cf2a1c-b2a4-415e-841b-8c7c3eb01cab', '72cf2a1c-b2a4-415e-841b-8c7c3eb01cab', '{"sub": "72cf2a1c-b2a4-415e-841b-8c7c3eb01cab", "email": "kola@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2025-10-18 12:39:23.620664+00', '2025-10-18 12:39:23.620722+00', '2025-10-18 12:39:23.620722+00', '707f2685-e412-47d0-94ac-eb9566da16a2'),
	('4968e983-0d9d-4f97-b70d-2426431a3ab8', '4968e983-0d9d-4f97-b70d-2426431a3ab8', '{"sub": "4968e983-0d9d-4f97-b70d-2426431a3ab8", "email": "hakeem@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2025-10-18 12:39:41.502069+00', '2025-10-18 12:39:41.50212+00', '2025-10-18 12:39:41.50212+00', '1f8e0d48-502b-4a5b-a0ce-2c44cbf61099');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."one_time_tokens" ("id", "user_id", "token_type", "token_hash", "relates_to", "created_at", "updated_at") VALUES
	('34957460-f3ba-41be-b746-b928844b3ebd', '4968e983-0d9d-4f97-b70d-2426431a3ab8', 'confirmation_token', '730abf1948d5127ecf9dddfe8b4ce572c70b0a4a2c97f8678ab0693e', 'hakeem@gmail.com', '2025-10-18 12:39:41.835463', '2025-10-18 12:39:41.835463');


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."courses" ("id", "course_name", "code", "credit_hours", "created_at") VALUES
	('4325aba5-b796-423f-a0e3-6c4f847983b4', 'Mathematics', 'MATH101', 3, '2025-10-18 13:42:16.499681'),
	('19cbb453-de1d-4357-92c0-26e5a53a37d6', 'English Language', 'ENG102', 2, '2025-10-18 13:42:16.499681'),
	('69d8713f-6448-4618-8888-564fc4ac46f9', 'Computer Science', 'CSC103', 4, '2025-10-18 13:42:16.499681');


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."students" ("id", "full_name", "email", "date_of_birth", "gender", "created_at") VALUES
	('2158fb64-565b-4ae2-98e0-8c0d9da00d79', 'John Doe', 'john@example.com', '2005-05-15', 'Male', '2025-10-18 13:42:16.499681'),
	('a40a5734-5de7-4d06-919d-ebfd94f20e93', 'Jane Smith', 'jane@example.com', '2006-07-22', 'Female', '2025-10-18 13:42:16.499681'),
	('e7467266-8ea3-4a8e-baab-7ab41cf02aa3', 'David Johnson', 'david@example.com', '2004-12-01', 'Male', '2025-10-18 13:42:16.499681');


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."enrollments" ("id", "student_id", "course_id", "enrollment_date") VALUES
	(1, '2158fb64-565b-4ae2-98e0-8c0d9da00d79', '4325aba5-b796-423f-a0e3-6c4f847983b4', '2025-10-18 13:42:16.499681');


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."enrollments_id_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict bRyn4yYrel5TlXrslr7LyDbCfgjnDykG9r5dieXNq2NdKGFaqsiXxfne9DxtkXg

RESET ALL;

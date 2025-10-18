SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict loZg0y2GILhhyZYpwaRw27RdwDTiIxRV1OoRGd1TFZCVS7YChd8n4TMTcgyVzRU

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



--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: grade_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
-- Name: grade_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."grade_audit_id_seq"', 1, false);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."grades_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

-- \unrestrict loZg0y2GILhhyZYpwaRw27RdwDTiIxRV1OoRGd1TFZCVS7YChd8n4TMTcgyVzRU

RESET ALL;

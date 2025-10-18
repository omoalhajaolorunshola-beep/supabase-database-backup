


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "pg_database_owner";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE OR REPLACE FUNCTION "public"."log_grade_change"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  insert into grade_audit (grade_id, old_grade, new_grade)
  values (old.id, old.grade, new.grade);
  return new;
end;
$$;


ALTER FUNCTION "public"."log_grade_change"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."courses" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "course_name" "text" NOT NULL,
    "code" "text" NOT NULL,
    "credit_hours" integer NOT NULL,
    "created_at" timestamp without time zone DEFAULT "now"(),
    "title" "text"
);


ALTER TABLE "public"."courses" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."departments" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "name" "text" NOT NULL,
    "created_at" timestamp without time zone DEFAULT "now"()
);


ALTER TABLE "public"."departments" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."enrollments" (
    "id" integer NOT NULL,
    "student_id" "uuid",
    "course_id" "uuid",
    "enrollment_date" timestamp without time zone DEFAULT "now"()
);


ALTER TABLE "public"."enrollments" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."enrollments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."enrollments_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."enrollments_id_seq" OWNED BY "public"."enrollments"."id";



CREATE TABLE IF NOT EXISTS "public"."grade_audit" (
    "id" integer NOT NULL,
    "grade_id" integer,
    "old_grade" numeric,
    "new_grade" numeric,
    "changed_at" timestamp without time zone DEFAULT "now"()
);


ALTER TABLE "public"."grade_audit" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."grade_audit_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."grade_audit_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."grade_audit_id_seq" OWNED BY "public"."grade_audit"."id";



CREATE TABLE IF NOT EXISTS "public"."grades" (
    "id" integer NOT NULL,
    "student_id" "uuid",
    "course_id" "uuid",
    "grade" numeric,
    "recorded_at" timestamp without time zone DEFAULT "now"(),
    CONSTRAINT "grades_grade_check" CHECK ((("grade" >= (0)::numeric) AND ("grade" <= (100)::numeric)))
);


ALTER TABLE "public"."grades" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."grades_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "public"."grades_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."grades_id_seq" OWNED BY "public"."grades"."id";



CREATE TABLE IF NOT EXISTS "public"."students" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "full_name" "text" NOT NULL,
    "email" "text" NOT NULL,
    "date_of_birth" "date",
    "gender" "text",
    "created_at" timestamp without time zone DEFAULT "now"(),
    CONSTRAINT "students_gender_check" CHECK (("gender" = ANY (ARRAY['Male'::"text", 'Female'::"text"])))
);


ALTER TABLE "public"."students" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."teachers" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "full_name" "text" NOT NULL,
    "email" "text" NOT NULL,
    "department_id" "uuid",
    "created_at" timestamp without time zone DEFAULT "now"()
);


ALTER TABLE "public"."teachers" OWNER TO "postgres";


ALTER TABLE ONLY "public"."enrollments" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."enrollments_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."grade_audit" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."grade_audit_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."grades" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."grades_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."courses"
    ADD CONSTRAINT "courses_code_key" UNIQUE ("code");



ALTER TABLE ONLY "public"."courses"
    ADD CONSTRAINT "courses_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."departments"
    ADD CONSTRAINT "departments_name_key" UNIQUE ("name");



ALTER TABLE ONLY "public"."departments"
    ADD CONSTRAINT "departments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."grade_audit"
    ADD CONSTRAINT "grade_audit_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."grades"
    ADD CONSTRAINT "grades_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."students"
    ADD CONSTRAINT "students_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."students"
    ADD CONSTRAINT "students_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_email_key" UNIQUE ("email");



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_pkey" PRIMARY KEY ("id");



CREATE OR REPLACE TRIGGER "trg_grade_update" AFTER UPDATE ON "public"."grades" FOR EACH ROW WHEN (("old"."grade" IS DISTINCT FROM "new"."grade")) EXECUTE FUNCTION "public"."log_grade_change"();



ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."enrollments"
    ADD CONSTRAINT "enrollments_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."students"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."grades"
    ADD CONSTRAINT "grades_course_id_fkey" FOREIGN KEY ("course_id") REFERENCES "public"."courses"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."grades"
    ADD CONSTRAINT "grades_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."students"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."teachers"
    ADD CONSTRAINT "teachers_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "public"."departments"("id") ON DELETE SET NULL;



ALTER TABLE "public"."students" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "students_can_view_self" ON "public"."students" FOR SELECT USING ((("auth"."uid"())::"text" = ("id")::"text"));



GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON FUNCTION "public"."log_grade_change"() TO "anon";
GRANT ALL ON FUNCTION "public"."log_grade_change"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."log_grade_change"() TO "service_role";



GRANT ALL ON TABLE "public"."courses" TO "anon";
GRANT ALL ON TABLE "public"."courses" TO "authenticated";
GRANT ALL ON TABLE "public"."courses" TO "service_role";



GRANT ALL ON TABLE "public"."departments" TO "anon";
GRANT ALL ON TABLE "public"."departments" TO "authenticated";
GRANT ALL ON TABLE "public"."departments" TO "service_role";



GRANT ALL ON TABLE "public"."enrollments" TO "anon";
GRANT ALL ON TABLE "public"."enrollments" TO "authenticated";
GRANT ALL ON TABLE "public"."enrollments" TO "service_role";



GRANT ALL ON SEQUENCE "public"."enrollments_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."enrollments_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."enrollments_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."grade_audit" TO "anon";
GRANT ALL ON TABLE "public"."grade_audit" TO "authenticated";
GRANT ALL ON TABLE "public"."grade_audit" TO "service_role";



GRANT ALL ON SEQUENCE "public"."grade_audit_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."grade_audit_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."grade_audit_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."grades" TO "anon";
GRANT ALL ON TABLE "public"."grades" TO "authenticated";
GRANT ALL ON TABLE "public"."grades" TO "service_role";



GRANT ALL ON SEQUENCE "public"."grades_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."grades_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."grades_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."students" TO "anon";
GRANT ALL ON TABLE "public"."students" TO "authenticated";
GRANT ALL ON TABLE "public"."students" TO "service_role";



GRANT ALL ON TABLE "public"."teachers" TO "anon";
GRANT ALL ON TABLE "public"."teachers" TO "authenticated";
GRANT ALL ON TABLE "public"."teachers" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "service_role";







RESET ALL;

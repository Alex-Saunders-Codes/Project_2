-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8E0aH7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "llp_domains" (
    "llp_id" INT   NOT NULL,
    "llp_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_llp_domains" PRIMARY KEY (
        "llp_id"
     )
);

CREATE TABLE "school_information" (
    "school_id" INT   NOT NULL,
    "school_name" VARCHAR(45)   NOT NULL,
    "school_section" VARCHAR(20)   NOT NULL,
    "alp_category" VARCHAR   NOT NULL,
    "alp_title" VARCHAR   NOT NULL,
    "llp_id1" INT   NOT NULL,
    "llp_title1" VARCHAR   NOT NULL,
    "llp_id2" INT   NOT NULL,
    "llp_title2" VARCHAR   NOT NULL,
    "url_address" VARCHAR(45)   NOT NULL,
    "address" VARCHAR(60)   NOT NULL,
    "postal_code" VARCHAR(6)   NOT NULL,
    "telephone_no" VARCHAR(8)   NOT NULL,
    "telephone_no_2" VARCHAR(8)   NOT NULL,
    "fax_no" VARCHAR(8)   NOT NULL,
    "fax_no_2" VARCHAR(8)   NOT NULL,
    "email_address" VARCHAR(30)   NOT NULL,
    "mrt_desc" VARCHAR(60)   NOT NULL,
    "bus_desc" VARCHAR   NOT NULL,
    "principal_name" VARCHAR   NOT NULL,
    "first_vp_name" VARCHAR   NOT NULL,
    "second_vp_name" VARCHAR   NOT NULL,
    "third_vp_name" VARCHAR   NOT NULL,
    "fourth_vp_name" VARCHAR   NOT NULL,
    "fifth_vp_name" VARCHAR   NOT NULL,
    "sixth_vp_name" VARCHAR   NOT NULL,
    "dgp_code" VARCHAR(30)   NOT NULL,
    "zone_code" VARCHAR(10)   NOT NULL,
    "type_code" VARCHAR(30)   NOT NULL,
    "nature_code" VARCHAR(30)   NOT NULL,
    "session_code" VARCHAR(30)   NOT NULL,
    "mainlevel_code" VARCHAR(20)   NOT NULL,
    "sap_ind" BOOLEAN   NOT NULL,
    "autonomous_ind" BOOLEAN   NOT NULL,
    "gifted_ind" BOOLEAN   NOT NULL,
    "ip_ind" BOOLEAN   NOT NULL,
    CONSTRAINT "pk_school_information" PRIMARY KEY (
        "school_id"
     )
);

CREATE TABLE "languages_spoken" (
    "school_id" INT   NOT NULL,
    "language_id" INT   NOT NULL
);

CREATE TABLE "mothertongues" (
    "language_id" INT   NOT NULL,
    "language" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_mothertongues" PRIMARY KEY (
        "language_id"
     )
);

CREATE TABLE "school_subjects" (
    "school_id" INT   NOT NULL,
    "subjects_id" INT   NOT NULL
);

CREATE TABLE "subjects" (
    "subject_id" INT   NOT NULL,
    "subject_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_subjects" PRIMARY KEY (
        "subject_id"
     )
);

CREATE TABLE "school_moe" (
    "school_id" INT   NOT NULL,
    "moe_id" INT   NOT NULL
);

CREATE TABLE "moe" (
    "moe_id" INT   NOT NULL,
    "moe_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_moe" PRIMARY KEY (
        "moe_id"
     )
);

CREATE TABLE "co_curricular_activities" (
    "activity_key" SERIAL   NOT NULL,
    "generic_name" VARCHAR(20)   NOT NULL,
    "school_id" INT   NOT NULL,
    "grouping_desc" VARCHAR(20)   NOT NULL,
    "customized_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_co_curricular_activities" PRIMARY KEY (
        "activity_key"
     )
);

ALTER TABLE "school_information" ADD CONSTRAINT "fk_school_information_llp_id1" FOREIGN KEY("llp_id1")
REFERENCES "llp_domains" ("llp_id");

ALTER TABLE "school_information" ADD CONSTRAINT "fk_school_information_llp_id2" FOREIGN KEY("llp_id2")
REFERENCES "llp_domains" ("llp_id");

ALTER TABLE "languages_spoken" ADD CONSTRAINT "fk_languages_spoken_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");

ALTER TABLE "languages_spoken" ADD CONSTRAINT "fk_languages_spoken_language_id" FOREIGN KEY("language_id")
REFERENCES "mothertongues" ("language_id");

ALTER TABLE "school_subjects" ADD CONSTRAINT "fk_school_subjects_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");

ALTER TABLE "school_subjects" ADD CONSTRAINT "fk_school_subjects_subjects_id" FOREIGN KEY("subjects_id")
REFERENCES "subjects" ("subject_id");

ALTER TABLE "school_moe" ADD CONSTRAINT "fk_school_moe_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");

ALTER TABLE "school_moe" ADD CONSTRAINT "fk_school_moe_moe_id" FOREIGN KEY("moe_id")
REFERENCES "moe" ("moe_id");

ALTER TABLE "co_curricular_activities" ADD CONSTRAINT "fk_co_curricular_activities_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");


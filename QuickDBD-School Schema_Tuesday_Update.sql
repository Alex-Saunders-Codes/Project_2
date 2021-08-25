-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8E0aH7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "school_information" (
    "school_id" INT   NOT NULL,
    "school_name" VARCHAR(45)   NOT NULL,
    "school_section" VARCHAR(20)   NOT NULL,
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
    "language_spoken_1" VARCHAR   NOT NULL,
    "language_spoken_2" VARCHAR   NOT NULL,
    "language_spoken_3" VARCHAR   NOT NULL,
    "alp_category" VARCHAR   NOT NULL,
    "alp_title" VARCHAR   NOT NULL,
    "llp_domain1" VARCHAR   NOT NULL,
    "llp_title1" VARCHAR   NOT NULL,
    "llp_domain2" VARCHAR   NOT NULL,
    "llp_title2" VARCHAR   NOT NULL,
    CONSTRAINT "pk_school_information" PRIMARY KEY (
        "school_id"
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
    "school_name" INT   NOT NULL,
    "moe_program" VARCHAR   NOT NULL
);

CREATE TABLE "co_curricular_activities" (
    "activity_key" SERIAL   NOT NULL,
    "school_section" VARCHAR(20)   NOT NULL,
    "generic_name" VARCHAR(20)   NOT NULL,
    "grouping_desc" VARCHAR(20)   NOT NULL,
    "customized_name" VARCHAR(20)   NOT NULL,
    "school_id" INT   NOT NULL,
    CONSTRAINT "pk_co_curricular_activities" PRIMARY KEY (
        "activity_key"
     )
);

ALTER TABLE "school_subjects" ADD CONSTRAINT "fk_school_subjects_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");

ALTER TABLE "school_subjects" ADD CONSTRAINT "fk_school_subjects_subjects_id" FOREIGN KEY("subjects_id")
REFERENCES "subjects" ("subject_id");

ALTER TABLE "school_moe" ADD CONSTRAINT "fk_school_moe_school_name" FOREIGN KEY("school_name")
REFERENCES "school_information" ("school_name");

ALTER TABLE "co_curricular_activities" ADD CONSTRAINT "fk_co_curricular_activities_school_id" FOREIGN KEY("school_id")
REFERENCES "school_information" ("school_id");


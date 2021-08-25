-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8E0aH7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "llp_domains" (
    "llp_id" INT NOT NULL,
    "llp_name" VARCHAR   ,
    CONSTRAINT "pk_llp_domains" PRIMARY KEY (
        "llp_id"
     )
);

CREATE TABLE "school_information" (
    "school_id" INT NOT NULL,
    "school_name" VARCHAR(45) NOT NULL,
    "school_section" VARCHAR(20),
    "alp_category" VARCHAR,
    "alp_title" VARCHAR,
    "llp_id1" INT,
    "llp_title1" VARCHAR,
    "llp_id2" INT,
    "llp_title2" VARCHAR,
    "url_address" VARCHAR(45),
    "address" VARCHAR(60),
    "postal_code" VARCHAR(6),
    "telephone_no" VARCHAR(8),
    "telephone_no_2" VARCHAR(8),
    "fax_no" VARCHAR(8),
    "fax_no_2" VARCHAR(8),
    "email_address" VARCHAR(30),
    "mrt_desc" VARCHAR(60),
    "bus_desc" VARCHAR,
    "principal_name" VARCHAR,
    "first_vp_name" VARCHAR,
    "second_vp_name" VARCHAR,
    "third_vp_name" VARCHAR,
    "fourth_vp_name" VARCHAR,
    "fifth_vp_name" VARCHAR,
    "sixth_vp_name" VARCHAR,
    "dgp_code" VARCHAR(30),
    "zone_code" VARCHAR(10),
    "type_code" VARCHAR(30),
    "nature_code" VARCHAR(30),
    "session_code" VARCHAR(30),
    "mainlevel_code" VARCHAR(20),
    "sap_ind" BOOLEAN,
    "autonomous_ind" BOOLEAN,
    "gifted_ind" BOOLEAN,
    "ip_ind" BOOLEAN,
    CONSTRAINT "pk_school_information" PRIMARY KEY (
        "school_id"
     )
);

CREATE TABLE "languages_spoken" (
    "school_id" INT NOT NULL,
    "language_id" INT NOT NULL
);

CREATE TABLE "mothertongues" (
    "language_id" INT  NOT NULL,
    "language" VARCHAR(10) NOT NULL,
    CONSTRAINT "pk_mothertongues" PRIMARY KEY (
        "language_id"
     )
);

CREATE TABLE "school_subjects" (
    "school_id" INT  NOT NULL,
    "subjects_id" INT   
);

CREATE TABLE "subjects" (
    "subject_id" INT NOT NULL,
    "subject_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_subjects" PRIMARY KEY (
        "subject_id"
     )
);

CREATE TABLE "school_moe" (
    "school_id" INT NOT NULL,
    "moe_id" INT NOT NULL
);

CREATE TABLE "moe" (
    "moe_id" INT NOT NULL,
    "moe_name" VARCHAR NOT NULL,
    CONSTRAINT "pk_moe" PRIMARY KEY (
        "moe_id"
     )
);

CREATE TABLE "co_curricular_activities" (
    "activity_key" SERIAL NOT NULL,
    "generic_name" VARCHAR(20)   ,
    "school_id" INT  NOT NULL,
    "grouping_desc" VARCHAR(20)   ,
    "customized_name" VARCHAR(20)   ,
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


CREATE SEQUENCE "DRILLS_SEQ"

/

CREATE SEQUENCE "DRILL_SESSIONS_SEQ"

/

CREATE SEQUENCE "EXERCISES_SEQ"

/

CREATE SEQUENCE "MUSCLES_SEQ"

/

CREATE SEQUENCE "WORKOUTS_SEQ"

/

CREATE SEQUENCE "WORKOUT_SESSIONS_SEQ"

/

CREATE SEQUENCE "ZONES_SEQ"

/

CREATE TABLE "DRILLS" (
"ID" NUMBER(38,0) NOT NULL,
 "EXERCISE_ID" NUMBER(38,0) NOT NULL,
 "MAX_REPS" NUMBER(38,0),
 "MIN_REPS" NUMBER(38,0),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012099 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "DRILLS_WORKOUTS" (
"DRILL_ID" NUMBER(38,0) NOT NULL,
 "WORKOUT_ID" NUMBER(38,0) NOT NULL,
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE
)

/



/



/

CREATE TABLE "DRILL_SESSIONS" (
"ID" NUMBER(38,0) NOT NULL,
 "WORKOUT_SESSION_ID" NUMBER(38,0) NOT NULL,
 "DRILL_ID" NUMBER(38,0) NOT NULL,
 "WEIGHT" NUMBER(38,0),
 "REPS" NUMBER(38,0),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012108 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "EXERCISES" (
"ID" NUMBER(38,0) NOT NULL,
 "NAME" VARCHAR2(255),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012092 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "EXERCISES_MUSCLES" (
"MUSCLE_ID" NUMBER(38,0) NOT NULL,
 "EXERCISE_ID" NUMBER(38,0) NOT NULL,
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE
)

/



/



/

CREATE TABLE "MUSCLES" (
"ID" NUMBER(38,0) NOT NULL,
 "NAME" VARCHAR2(255),
 "ZONE_ID" NUMBER(38,0) NOT NULL,
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012090 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "SCHEMA_MIGRATIONS" (
"VERSION" VARCHAR2(255) NOT NULL
)

/

CREATE UNIQUE INDEX "UNIQUE_SCHEMA_MIGRATIONS" ON "SCHEMA_MIGRATIONS" ("VERSION")

/



/

CREATE TABLE "WORKOUTS" (
"ID" NUMBER(38,0) NOT NULL,
 "NAME" VARCHAR2(255),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012096 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "WORKOUT_SESSIONS" (
"ID" NUMBER(38,0) NOT NULL,
 "WORKOUT_ID" NUMBER(38,0) NOT NULL,
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012104 PRIMARY KEY (ID)
)

/



/



/

CREATE TABLE "ZONES" (
"ID" NUMBER(38,0) NOT NULL,
 "NAME" VARCHAR2(255),
 "CREATED_AT" DATE,
 "UPDATED_AT" DATE,
 CONSTRAINT SYS_C0012087 PRIMARY KEY (ID)
)

/



/



/

ALTER TABLE "DRILLS" ADD CONSTRAINT "DRILLS_EXERCISE_ID_FK" FOREIGN KEY ("EXERCISE_ID") REFERENCES "EXERCISES"("ID")

/

ALTER TABLE "DRILLS_WORKOUTS" ADD CONSTRAINT "DRILLS_WORKOUTS_DRILL_ID_FK" FOREIGN KEY ("DRILL_ID") REFERENCES "DRILLS"("ID")

/

ALTER TABLE "DRILLS_WORKOUTS" ADD CONSTRAINT "DRILLS_WORKOUTS_WORKOUT_ID_FK" FOREIGN KEY ("WORKOUT_ID") REFERENCES "WORKOUTS"("ID")

/

ALTER TABLE "DRILL_SESSIONS" ADD CONSTRAINT "DRILL_SESSIONS_DRILL_ID_FK" FOREIGN KEY ("DRILL_ID") REFERENCES "DRILLS"("ID")

/

ALTER TABLE "DRILL_SESSIONS" ADD CONSTRAINT "DRI_SES_WOR_SES_ID_FK" FOREIGN KEY ("WORKOUT_SESSION_ID") REFERENCES "WORKOUT_SESSIONS"("ID")

/

ALTER TABLE "EXERCISES_MUSCLES" ADD CONSTRAINT "EXERCISES_MUSCLES_MUSCLE_ID_FK" FOREIGN KEY ("MUSCLE_ID") REFERENCES "MUSCLES"("ID")

/

ALTER TABLE "EXERCISES_MUSCLES" ADD CONSTRAINT "EXE_MUS_EXE_ID_FK" FOREIGN KEY ("EXERCISE_ID") REFERENCES "EXERCISES"("ID")

/

ALTER TABLE "MUSCLES" ADD CONSTRAINT "MUSCLES_ZONE_ID_FK" FOREIGN KEY ("ZONE_ID") REFERENCES "ZONES"("ID")

/

ALTER TABLE "WORKOUT_SESSIONS" ADD CONSTRAINT "WORKOUT_SESSIONS_WORKOUT_ID_FK" FOREIGN KEY ("WORKOUT_ID") REFERENCES "WORKOUTS"("ID")

/

INSERT INTO schema_migrations (version) VALUES ('20140930140224')

/

INSERT INTO schema_migrations (version) VALUES ('20141001082724')

/

INSERT INTO schema_migrations (version) VALUES ('20140930140224')

/

INSERT INTO schema_migrations (version) VALUES ('20141001082724')

/



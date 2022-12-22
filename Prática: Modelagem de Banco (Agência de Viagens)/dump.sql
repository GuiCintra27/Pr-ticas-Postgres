CREATE TABLE "public.companies" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "companies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.flights" (
	"id" serial NOT NULL,
	"company_id" integer NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"exit_point" integer NOT NULL,
	"arrival_point" integer NOT NULL,
	"exit_hour" timestamp with time zone NOT NULL,
	"arrival_hour" timestamp with time zone NOT NULL,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.airports" (
	"id" serial NOT NULL,
	"acronym" TEXT NOT NULL UNIQUE,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "airports_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("company_id") REFERENCES "companies"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("exit_point") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("arrival_point") REFERENCES "airports"("id");






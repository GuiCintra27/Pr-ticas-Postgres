CREATE TABLE "public.disks" (
	"id" serial NOT NULL,
	"number" integer NOT NULL UNIQUE,
	"barcode" TEXT NOT NULL UNIQUE,
	"movie_id" integer NOT NULL,
	CONSTRAINT "disks_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.movies" (
	"id" serial NOT NULL,
	"title" TEXT NOT NULL UNIQUE,
	"category_id" integer NOT NULL,
	CONSTRAINT "movies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.actors" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"movie_id" integer NOT NULL,
	"birth_date" DATE NOT NULL,
	"country_id" integer NOT NULL,
	CONSTRAINT "actors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.countries" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "countries_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"phone_id" integer NOT NULL,
	"adress_id" integer NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.phones" (
	"id" serial NOT NULL,
	"number" TEXT NOT NULL UNIQUE,
	CONSTRAINT "phones_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adresses" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"district_id" integer NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.districts" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"city_id" integer NOT NULL,
	CONSTRAINT "districts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"state_id" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




CREATE TABLE "public.locations" (
	"id" serial NOT NULL,
	"disk_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"location_date" DATE NOT NULL,
	"devolution_date" DATE,
	"location_code" TEXT NOT NULL,
	CONSTRAINT "locations_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.locations_satisfaction_search" (
	"id" serial NOT NULL,
	"location_id" integer NOT NULL,
	"cutomer_id" integer NOT NULL,
	"score" integer NOT NULL,
	CONSTRAINT "locations_satisfaction_search_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.movies_satisfaction_search" (
	"id" serial NOT NULL,
	"movie_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"score" integer NOT NULL,
	CONSTRAINT "movies_satisfaction_search_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "disks" ADD CONSTRAINT "disks_fk0" FOREIGN KEY ("movie_id") REFERENCES "movies"("id");

ALTER TABLE "movies" ADD CONSTRAINT "movies_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");

ALTER TABLE "actors" ADD CONSTRAINT "actors_fk0" FOREIGN KEY ("movie_id") REFERENCES "movies"("id");
ALTER TABLE "actors" ADD CONSTRAINT "actors_fk1" FOREIGN KEY ("country_id") REFERENCES "countries"("id");




ALTER TABLE "locations" ADD CONSTRAINT "locations_fk0" FOREIGN KEY ("disk_id") REFERENCES "disks"("id");
ALTER TABLE "locations" ADD CONSTRAINT "locations_fk1" FOREIGN KEY ("customer_id") REFERENCES "customers"("id");

ALTER TABLE "locations_satisfaction_search" ADD CONSTRAINT "locations_satisfaction_search_fk0" FOREIGN KEY ("location_id") REFERENCES "locations"("id");
ALTER TABLE "locations_satisfaction_search" ADD CONSTRAINT "locations_satisfaction_search_fk1" FOREIGN KEY ("cutomer_id") REFERENCES "customers"("id");

ALTER TABLE "movies_satisfaction_search" ADD CONSTRAINT "movies_satisfaction_search_fk0" FOREIGN KEY ("movie_id") REFERENCES "movies"("id");
ALTER TABLE "movies_satisfaction_search" ADD CONSTRAINT "movies_satisfaction_search_fk1" FOREIGN KEY ("customer_id") REFERENCES "customers"("id");




ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("phone_id") REFERENCES "phones"("id");
ALTER TABLE "customers" ADD CONSTRAINT "customers_fk1" FOREIGN KEY ("adress_id") REFERENCES "adresses"("id");


ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("district_id") REFERENCES "districts"("id");

ALTER TABLE "districts" ADD CONSTRAINT "districts_fk0" FOREIGN KEY ("city_id") REFERENCES "cities"("id");


ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("state_id") REFERENCES "states"("id");







CREATE TABLE "public.studants" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"class" integer NOT NULL,
	CONSTRAINT "studants_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.classes" (
	"id" serial NOT NULL,
	"code" TEXT NOT NULL UNIQUE,
	CONSTRAINT "classes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.studants_class_register" (
	"id" serial NOT NULL,
	"studant_id" integer NOT NULL,
	"class_id" integer NOT NULL,
	"incoming" DATE NOT NULL,
	"outgoing" DATE,
	CONSTRAINT "studants_class_register_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.projects" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"studant_id" integer NOT NULL,
	"delivery_date" DATE NOT NULL,
	"score_id" integer NOT NULL,
	"module_id" integer NOT NULL,
	CONSTRAINT "projects_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.score_values" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "score_values_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.modules" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "modules_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "studants" ADD CONSTRAINT "studants_fk0" FOREIGN KEY ("class") REFERENCES "classes"("id");


ALTER TABLE "studants_class_register" ADD CONSTRAINT "studants_class_register_fk0" FOREIGN KEY ("studant_id") REFERENCES "studants"("id");
ALTER TABLE "studants_class_register" ADD CONSTRAINT "studants_class_register_fk1" FOREIGN KEY ("class_id") REFERENCES "classes"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("studant_id") REFERENCES "studants"("id");
ALTER TABLE "projects" ADD CONSTRAINT "projects_fk1" FOREIGN KEY ("score_id") REFERENCES "score_values"("id");
ALTER TABLE "projects" ADD CONSTRAINT "projects_fk2" FOREIGN KEY ("module_id") REFERENCES "modules"("id");










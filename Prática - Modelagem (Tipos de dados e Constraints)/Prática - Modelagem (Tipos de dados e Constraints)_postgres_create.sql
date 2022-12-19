CREATE TABLE "public.Users" (
	"Id" serial NOT NULL,
	"Name" varchar(80) NOT NULL,
	"Email" varchar(255) NOT NULL UNIQUE,
	"Password" varchar(32) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"Id" serial NOT NULL,
	"Name" varchar(255) NOT NULL,
	"Price" double NOT NULL,
	"CategoryId" int NOT NULL,
	"Size" varchar(6) NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ProductsImages" (
	"Id" serial NOT NULL,
	"ProductId" int NOT NULL,
	"MainPicture" BOOLEAN NOT NULL DEFAULT 'false',
	"PictureId" int NOT NULL,
	CONSTRAINT "ProductsImages_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ImageServer" (
	"id" serial NOT NULL,
	CONSTRAINT "ImageServer_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categories" (
	"id" serial NOT NULL,
	"Name" varchar(64) NOT NULL UNIQUE,
	CONSTRAINT "Categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Cart" (
	"id" serial NOT NULL,
	"UserId" int NOT NULL,
	"ProductId" int NOT NULL,
	"Quantity" int(5) NOT NULL,
	CONSTRAINT "Cart_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Log" (
	"id" serial NOT NULL,
	"UserId" int NOT NULL,
	"PurchaseDescription" TEXT NOT NULL,
	"Status" varchar(12) NOT NULL,
	"Adress" TEXT DEFAULT 'PurchaseNotPerformed',
	"PurchaseDate" TIMESTAMP NOT NULL DEFAULT 'Now()',
	CONSTRAINT "Log_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("CategoryId") REFERENCES "Categories"("id");

ALTER TABLE "ProductsImages" ADD CONSTRAINT "ProductsImages_fk0" FOREIGN KEY ("ProductId") REFERENCES "Products"("Id");
ALTER TABLE "ProductsImages" ADD CONSTRAINT "ProductsImages_fk1" FOREIGN KEY ("MainPicture") REFERENCES "Products"("Id");
ALTER TABLE "ProductsImages" ADD CONSTRAINT "ProductsImages_fk2" FOREIGN KEY ("PictureId") REFERENCES "ImageServer"("id");



ALTER TABLE "Cart" ADD CONSTRAINT "Cart_fk0" FOREIGN KEY ("UserId") REFERENCES "Users"("Id");
ALTER TABLE "Cart" ADD CONSTRAINT "Cart_fk1" FOREIGN KEY ("ProductId") REFERENCES "Products"("Id");

ALTER TABLE "Log" ADD CONSTRAINT "Log_fk0" FOREIGN KEY ("UserId") REFERENCES "Users"("Id");









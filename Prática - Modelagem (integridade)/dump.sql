CREATE TABLE IF NOT EXISTS "customers"(
    id SERIAL PRIMARY KEY,
    "fullName" VARCHAR(80) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(84) NOT NULL UNIQUE,
    password VARCHAR(32) NOT NULL
);

CREATE TABLE IF NOT EXISTS "bankAccount"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" VARCHAR(12) NOT NULL,
    agency VARCHAR(12) NOT NULL,
    "openDate" TIMESTAMP WHITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP WHITHOUT TIMEZONE
);

CREATE TABLE IF NOT EXISTS "transactions"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount DOUBLE(8,2) NOT NULL,
    type ENUM('deposit', 'withdraw') NOT NULL,
    time TIMESTAMP WHITHOUT TIMEZONE NOT NULL DEFAULT NOW(),
    description VARCHAR(255) NOT NULL,
    cancelled BOOLEAN
);

CREATE TABLE IF NOT EXISTS "creditCards"(
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name VARCHAR(80) NOT NULL,
    number VARCHAR(20) NOT NULL UNIQUE,
    "securityCode" VARCHAR(4) NOT NULL,
    "expirationMonth" INTEGER NOT NULL CHECK( 0 < "expirationMonth" < 13),
    "expirationYear" INTEGER NOT NULL,
    password VARCHAR(32) NOT NULL,
    limit INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "customerPhones"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number VARCHAR(15) NOT NULL UNIQUE
    type ENUM('landline', 'mobile') NOT NULL,
);

CREATE TABLE IF NOT EXISTS "customerAdresses"(
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL,
    street VARCHAR(255) NOT NULL,
    number INTEGER(5) NOT NULL,
    complement VARCHAR(255) NOT NULL,
    "postalCode" VARCHAR(255) NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "cities"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    "stateId" INTEGER NOT NULL,
);

CREATE TABLE IF NOT EXISTS "states"(
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) UNIQUE NOT NULL
);

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");
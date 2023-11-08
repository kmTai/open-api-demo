/* START */

DROP TABLE IF EXISTS "orderdetail" CASCADE;
DROP TABLE IF EXISTS "order" CASCADE;
DROP TABLE IF EXISTS "product" CASCADE;
DROP TABLE IF EXISTS "productline" CASCADE;
DROP TABLE IF EXISTS "customer" CASCADE;
DROP TABLE IF EXISTS "customerdetail" CASCADE;

DROP SEQUENCE IF EXISTS "product_seq";
DROP SEQUENCE IF EXISTS "order_seq";
DROP SEQUENCE IF EXISTS "customer_seq";

DROP VIEW IF EXISTS "customer_master";
DROP VIEW IF EXISTS "office_master";
DROP VIEW IF EXISTS "product_master";

CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- TABLE CUSTOMER

CREATE SEQUENCE "customer_seq" START 1000000;

CREATE TABLE "customer" (
  "customer_number"           BIGINT        NOT NULL DEFAULT NEXTVAL ('"customer_seq"'),
  "customer_name"             VARCHAR(50)   NOT NULL,
  "contact_last_name"         VARCHAR(50)   NOT NULL,
  "contact_first_name"        VARCHAR(50)   NOT NULL,
  "phone"                     VARCHAR(50)   NOT NULL,
  "sales_rep_employee_number" BIGINT        DEFAULT NULL,
  "credit_limit"              DECIMAL(10,2) DEFAULT NULL,
  "first_buy_date"            INT           DEFAULT NULL,
  CONSTRAINT "customer_pk" PRIMARY KEY ("customer_number"),
  CONSTRAINT "customer_name_uk" UNIQUE ("customer_name")
);

-- TABLE CUSTOMERDETAIL

CREATE TABLE "customerdetail" (
  "customer_number"     BIGINT      NOT NULL,
  "address_line_first"  VARCHAR(50) NOT NULL,
  "address_line_second" VARCHAR(50) DEFAULT NULL,
  "city"                VARCHAR(50) DEFAULT NULL,
  "state"               VARCHAR(50) DEFAULT NULL,
  "postal_code"         VARCHAR(15) DEFAULT NULL,
  "country"             VARCHAR(50) DEFAULT NULL,
  CONSTRAINT "customerdetail_pk" PRIMARY KEY ("customer_number"),
  CONSTRAINT "customer_address_line_first_uk" UNIQUE ("address_line_first"),  
  CONSTRAINT "customerdetail_customer_fk" FOREIGN KEY ("customer_number") REFERENCES "customer" ("customer_number")  
);

-- TABLE PRODUCTLINE

CREATE TABLE "productline" (
  "product_line"     VARCHAR(50)   NOT NULL,
  "code"             BIGINT        NOT NULL,
  "text_description" VARCHAR(4000) DEFAULT NULL,
  "html_description" XML           DEFAULT NULL,
  "image"            BYTEA         DEFAULT NULL,
  "created_on"       DATE          NOT NULL DEFAULT NOW(),
  CONSTRAINT "productline_pk" PRIMARY KEY ("product_line", "code"),
  CONSTRAINT "productline_uk" UNIQUE("product_line")
);

-- TABLE PRODUCT

CREATE SEQUENCE "product_seq" START 1000000;

CREATE TABLE "product" (
  "product_id"          BIGINT        NOT NULL DEFAULT NEXTVAL ('"product_seq"'),
  "product_name"        VARCHAR(70)   DEFAULT NULL,
  "product_line"        VARCHAR(50)   DEFAULT NULL,
  "code"                BIGINT        NOT NULL,
  "product_scale"       VARCHAR(10)   DEFAULT NULL,
  "product_vendor"      VARCHAR(50)   DEFAULT NULL,
  "product_description" TEXT          DEFAULT NULL,
  "quantity_in_stock"   INT           DEFAULT 0,
  "buy_price"           DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  "msrp"                DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  "specs"               HSTORE        DEFAULT NULL,
  "product_uid"         BIGINT        GENERATED BY DEFAULT AS IDENTITY (START WITH 10 INCREMENT BY 10),
  CONSTRAINT "product_pk" PRIMARY KEY ("product_id"),
  CONSTRAINT "product_productline_fk" FOREIGN KEY ("product_line","code") REFERENCES "productline" ("product_line","code")
);

-- TABLE ORDER

CREATE SEQUENCE "order_seq" START 1000000;

CREATE TABLE "order" (
  "order_id"        BIGINT        NOT NULL DEFAULT NEXTVAL ('"order_seq"'),
  "order_date"      DATE          NOT NULL,
  "required_date"   DATE          NOT NULL,
  "shipped_date"    DATE          DEFAULT NULL,
  "status"          VARCHAR(15)   NOT NULL,
  "comments"        TEXT          DEFAULT NULL,    
  "customer_number" BIGINT        NOT NULL,
  "amount"          DECIMAL(10,2) NOT NULL,
  CONSTRAINT "order_pk" PRIMARY KEY ("order_id"),
  CONSTRAINT "order_customer_fk" FOREIGN KEY ("customer_number") REFERENCES "customer" ("customer_number")
);

-- TABLE ORDERDETAIL

CREATE TABLE "orderdetail" (
  "orderdetail_id"    SERIAL        NOT NULL, 
  "order_id"          BIGINT        NOT NULL,
  "product_id"        BIGINT        NOT NULL,
  "quantity_ordered"  INT           NOT NULL,
  "price_each"        DECIMAL(10,2) NOT NULL,
  "order_line_number" INT           NOT NULL,
  CONSTRAINT "orderdetail_pk" PRIMARY KEY ("orderdetail_id"),
  CONSTRAINT "orderdetail_uk" UNIQUE ("order_id", "product_id"),
  CONSTRAINT "orderdetail_order_fk" FOREIGN KEY ("order_id") REFERENCES "order" ("order_id"),
  CONSTRAINT "orderdetail_product_fk" FOREIGN KEY ("product_id") REFERENCES "product" ("product_id")
);
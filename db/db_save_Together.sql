CREATE TABLE "ADM_Users" (
  "User_ID" SERIAL PRIMARY KEY,
  "User_Fname" "VARCHAR(20 )",
  "User_Lname" "VARCHAR(20 )",
  "User_Phone1" integer,
  "User_Phone2" integer,
  "User_Age" integer,
  "User_Email" varchar(50),
  "User_Password" varchar(20),
  "User_Address1" varchar(50),
  "User_Address2" varchar(50),
  "User_Status" text,
  "User_Country" varchar,
  "User_City" varchar,
  "User_CartNo" integer,
  "User_PostalCode" text,
  "User_CreditLimit" integer,
  "User_LastActivityDate" TIMESTAMP,
  "User_LastLoginDate" TIMESTAMP,
  "User_LastPasswordChangedDate" TIMESTAMP,
  "User_Profile" text,
  "User_Vendor" int
);

CREATE TABLE "Product" (
  "ProductID" int PRIMARY KEY,
  "User_ID" int,
  "prodcut_title" varchar,
  "metaTitle" varchar,
  "summary" text,
  "product_type" int,
  "product_price" float,
  "discount" float,
  "quantity" int,
  "shop" tinyint,
  "createdAt" datetime,
  "updatedAt" datetime,
  "publishedAt" datetime,
  "startsAt" datetime,
  "endsAt" datetime,
  "content" text,
  "sku" varchar
);

CREATE TABLE "Product_Category" (
  "ProductID" int,
  "CategoryID" int
);

CREATE TABLE "Category" (
  "CategoryID" bigint PRIMARY KEY,
  "parentID" int,
  "title" varchar,
  "metaTitle" varchar,
  "slug" varchar,
  "content" text
);

CREATE TABLE "Product_Review" (
  "reviewID" int PRIMARY KEY,
  "ProductID" int,
  "parentID" int,
  "title" varchar,
  "rating" int,
  "published" int,
  "createdAt" datetime,
  "publishedAt" datetime,
  "content" Text
);

CREATE TABLE "order_person" (
  "Order_person_ID" int[pk],
  "ProductID" int,
  "User_ID" int,
  "order_status" int,
  "subTotal" float,
  "ItemDiscount" float,
  "tax" float,
  "sku" varchar,
  "shipping" float,
  "total" float,
  "promo" varchar,
  "discount" float,
  "grandTotal" float,
  "line1" varchar,
  "line2" varchar,
  "User_City" varchar,
  "province" varchar,
  "User_Country" varchar,
  "quantity" int,
  "createdAt" datetime,
  "updatedAt" datetime,
  "content" text
);

CREATE TABLE "order_group" (
  "ProductID" int,
  "order_group_ID" int PRIMARY KEY,
  "order_quantity" int
);

CREATE TABLE "Cart" (
  "Cart_ID" int PRIMARY KEY,
  "User_ID" int,
  "status" int,
  "User_Fname" varchar,
  "User_Lname" varchar,
  "User_Phone1" varchar,
  "User_Email" varchar,
  "line1" varchar,
  "line2" varchar,
  "City" varchar,
  "province" varchar,
  "Country" varchar,
  "createdAt" datetime,
  "updatedAt" datetime,
  "content" text
);

CREATE TABLE "Cart_item" (
  "ID" int PRIMARY KEY,
  "ProductID" int,
  "Cart_ID" int,
  "sku" varchar,
  "price" float,
  "discount" float,
  "quantity" int,
  "active" int,
  "createdAt" datetime,
  "updatedAt" datetime,
  "content" text
);

ALTER TABLE "Cart" ADD FOREIGN KEY ("Cart_ID") REFERENCES "ADM_Users" ("User_CartNo");

ALTER TABLE "order_person" ADD FOREIGN KEY ("User_ID") REFERENCES "ADM_Users" ("User_ID");

ALTER TABLE "Cart_item" ADD FOREIGN KEY ("Cart_ID") REFERENCES "Cart" ("Cart_ID");

ALTER TABLE "Cart_item" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("CategoryID") REFERENCES "Category" ("CategoryID");

ALTER TABLE "Product_Review" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Product" ADD FOREIGN KEY ("User_ID") REFERENCES "ADM_Users" ("User_ID");

ALTER TABLE "Product" ADD FOREIGN KEY ("ProductID") REFERENCES "order_group" ("ProductID");

ALTER TABLE "order_person" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

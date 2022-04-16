
CREATE TABLE "Product" (
  "ProductID" int PRIMARY KEY,
  "User_ID" varchar,
  "prodcut_title" varchar,
  "metaTitle" varchar,
  "summary" text,
  "product_type" int,
  "product_price" float,
  "discount" float,
  "quantity" int,
  "group_qty" int, 
  "current_order_qty" int,  
  "status" int,
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "publishedAt" timestamp,
  "startsAt" timestamp,
  "endsAt" timestamp,
  "content" text,
  "serial_no" text,
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
  "createdAt" timestamp,
  "publishedAt" timestamp,
  "content" Text
);

CREATE TABLE "order_person" (
  "Order_person_ID" int PRIMARY KEY,
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
  "createdAt" timestamp,
  "updatedAt" timestamp,
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
  "createdAt" timestamp,
  "updatedAt" timestamp,
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
  "createdAt" timestamp,
  "updatedAt" timestamp,
  "content" text
);


ALTER TABLE "Cart_item" ADD FOREIGN KEY ("Cart_ID") REFERENCES "Cart" ("Cart_ID");

ALTER TABLE "Cart_item" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Product_Category" ADD FOREIGN KEY ("CategoryID") REFERENCES "Category" ("CategoryID");

ALTER TABLE "Product_Review" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");
 

ALTER TABLE "order_person" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");
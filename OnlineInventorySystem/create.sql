CREATE DATABASE OnlineInventorySystem;

USE OnlineInventorySystem;

CREATE TABLE
  Suppliers (
    Supplier_ID INT PRIMARY KEY NOT NULL,
    SupplierName VARCHAR(256),
    SupplierAddress VARCHAR(256),
    SupplierEmail VARCHAR(256),
    SupplierPhone NUMERIC(18),
  );

CREATE TABLE
  Products (
    Product_ID BIGINT PRIMARY KEY NOT NULL,
    ProductName VARCHAR(256),
    ProductPrice FLOAT,
    ProductQTY INT,
    DateDelivered DATE,
    Supplier_ID INT FOREIGN KEY REFERENCES Suppliers (Supplier_ID)
  );

CREATE TABLE
  Inventory (
    InvQTY INT,
    ProductName VARCHAR(256),
    Product_ID INT FOREIGN KEY REFERENCES Products (Product_ID)
  );

CREATE TABLE
  Staffs (
    Staff_ID INT PRIMARY KEY NOT NULL,
    StaffFirstName VARCHAR(256),
    StaffLastName VARCHAR(256),
    StaffAddress VARCHAR(256),
    StaffEmail VARCHAR(256),
    StaffUsername VARCHAR(256),
    StaffPassword VARCHAR(256)
  );

CREATE TABLE
  Customers (
    Customer_ID INT PRIMARY KEY NOT NULL,
    CustomerFirstName VARCHAR(256),
    CustomerLastName VARCHAR(256),
    CustomerAddress VARCHAR(256),
    CustomerPhone NUMERIC(18)
  );

CREATE TABLE
  Orders (
    Order_ID INT PRIMARY KEY NOT NULL,
    OrderDate DATE,
    OrderDiscount FLOAT,
    OrderQuantity INT,
    OrderTotal FLOAT,
    ProductName VARCHAR(256),
    ProductPrice INT,
    Customer_ID INT FOREIGN KEY REFERENCES Customers (Customer_ID),
    Payment_ID INT FOREIGN KEY REFERENCES Payment (Payment_ID),
    Staff_ID INT FOREIGN KEY REFERENCES Staffs (Staff_ID)
  );

CREATE TABLE
  Payment (
    Payment_ID INT PRIMARY KEY NOT NULL,
    PaymentType VARCHAR(256),
    Order_ID INT FOREIGN KEY REFERENCES Orders (Order_ID)
  );

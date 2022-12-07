INSERT INTO
  Suppliers (Supplier_ID, SupplierName, SupplierAddress, SupplierEmail, SupplierPhone)
VALUES
  (
    8907,
    'Kenneth Cole',
    'Camarin, Caloocan City',
    'kcole@student.fatima.edu.ph',
    9672007061
  ),
  (
    1050,
    'Joana Marie',
    'San Jose Del Monte, Bulacan',
    'jmarie@student.fatima.edu.ph',
    9965524769
  ),
  (
    530,
    'Sanji Vinsmoke',
    'Bagong Silang, Caloocan',
    'svinsmoke@student.fatima.edu.ph',
    9572573724
  ),
  (
    5351,
    'John Cunanan',
    'Malabon City',
    'jcunanan@student.fatima.edu.ph',
    9683383401
  ),
  (
    4331,
    'Nico Robin',
    'Malaria, Caloocan City',
    'nrobin@student.fatima.edu.ph',
    9924563729
  );

INSERT INTO
  Products (Product_ID, ProductName, ProductPrice, ProductQTY)
VALUES
  (3705, 'JOLLY MUSHROOM PIECES & STEMS 284G', 45.10, 79),
  (9816, 'NESTLE ALL PURPOSE CREAM 250ML', 74.00, 89),
  (148, 'ALCOPLUS ALCOHOL 70% SOLUTION ISOPROPYL 500ML', 91.90, 61),
  (7172, 'PUREFOODS CORNED BEEF 210G', 101.75, 52),
  (5250, 'GATORADE BLUE BOLT SPORTS DRINK 1.5L', 102.35, 73);

UPDATE
  Products
SET
  Supplier_ID = 8907
WHERE
  Product_ID = 3705;

UPDATE
  Products
SET
  Supplier_ID = 1050
WHERE
  Product_ID = 9816;

UPDATE
  Products
SET
  Supplier_ID = 530
WHERE
  Product_ID = 148;

UPDATE
  Products
SET
  Supplier_ID = 5351
WHERE
  Product_ID = 7172;

UPDATE
  Products
SET
  Supplier_ID = 5351
WHERE
  Product_ID = 5250;

UPDATE
  Products
SET
  DateDelivered = '01-01-2022'
WHERE
  Supplier_ID = 8907;

UPDATE
  Products
SET
  DateDelivered = '01-01-2022'
WHERE
  Supplier_ID = 1050;

UPDATE
  Products
SET
  DateDelivered = '01-01-2022'
WHERE
  Supplier_ID = 530;

UPDATE
  Products
SET
  DateDelivered = '01-01-2022'
WHERE
  Supplier_ID = 5351;

UPDATE
  Products
SET
  DateDelivered = '01-01-2022'
WHERE
  Supplier_ID = 4331;

INSERT INTO
  Inventory (InvQTY, ProductName, Product_ID)
VALUES
  (284, 'JOLLY MUSHROOM PIECES & STEMS 284G', 3705),
  (265, 'NESTLE ALL PURPOSE CREAM 250ML', 9816),
  (287, 'ALCOPLUS ALCOHOL 70% SOLUTION ISOPROPYL 500ML', 148),
  (262, 'PUREFOODS CORNED BEEF 210G', 7172),
  (272, 'GATORADE BLUE BOLT SPORTS DRINK 1.5L', 5250);

INSERT INTO
  Staffs (
    Staff_ID,
    StaffFirstName,
    StaffLastName,
    StaffAddress,
    StaffEmail,
    StaffUsername,
    StaffPassword
  )
VALUES
  (
    1000,
    'Finn',
    'Wolfhard',
    '106 DOYERS ST',
    'finn@gmail.com',
    'Mike',
    'Mikeyfinn'
  ),
  (1001, 'Jake', 'Wilson', '8 ARLINGTON DR', 'jakeW@gmail.com', 'Jake', 'Dog'),
  (1002, 'Harry', 'Potter', '138 AZKABAN', 'harry@gmail.com', 'Harry', 'Wizard'),
  (
    1003,
    'Hermione',
    'Granger',
    '599 NW BAY BLVD',
    'hermione@gmail.com',
    'Emma',
    'Muggel'
  ),
  (1004, 'Ron', 'Weasley', '72 ANDERSON PL', 'ronw@gmail.com', 'Ron', 'Bloddyhell');

INSERT INTO
  Customers (
    Customer_ID,
    CustomerFirstName,
    CustomerLastName,
    CustomerAddress,
    CustomerPhone
  )
VALUES
  (7773, 'Rodel', 'Cunanan', 'Purok 4, Caloocan City', 9567564773),
  (
    7592,
    'Vincent',
    'Chavez',
    'Brgy. 180 Miramonte Heights, Caloocan City',
    9567564773
  ),
  (
    7103,
    'John Ronald',
    'Cordua',
    'Brgy. 178 Phase 6, Camarin, Caloocan City',
    9075214698
  ),
  (
    8651,
    'Erwin',
    'Bandiola',
    'Diamond Crest, San Jose Del Monte, Bulacan',
    9443819625
  ),
  (7929, 'Marc Kyle', 'Salanta', 'Bagong Silang, Caloocan City', 9476526125);

INSERT INTO
  Orders (
    Order_ID,
    OrderDate,
    OrderDiscount,
    OrderQuantity,
    OrderTotal,
    ProductName,
    ProductPrice,
    Customer_ID,
    Staff_ID
  )
VALUES
  (
    20221,
    '10-10-2022',
    10.12,
    1,
    34.98,
    'JOLLY MUSHROOM PIECES & STEMS 284G',
    45.10,
    7773,
    1000
  ),
  (
    20223,
    '07-27-2022',
    50.1,
    4,
    245.90,
    'NESTLE ALL PURPOSE CREAM 250ML',
    74.00,
    7592,
    1001
  ),
  (
    20225,
    '2-12-2022',
    50.23,
    3,
    41.67,
    'ALCOPLUS ALCOHOL 70% SOLUTION ISOPROPYL 500ML',
    91.90,
    7103,
    1002
  ),
  (
    20227,
    '11-02-2022',
    75.89,
    1,
    25.86,
    'PUREFOODS CORNED BEEF 210G',
    101.75,
    8651,
    1003
  ),
  (
    20229,
    '02-23-2022',
    30.01,
    2,
    72.34,
    'GATORADE BLUE BOLT SPORTS DRINK 1.5L',
    102.35,
    7929,
    1004
  );

UPDATE
  Orders
SET
  Payment_ID = 148333
WHERE
  Customer_ID = 7773;

UPDATE
  Orders
SET
  Payment_ID = 87369
WHERE
  Customer_ID = 7592;

UPDATE
  Orders
SET
  Payment_ID = 51779
WHERE
  Customer_ID = 7103;

UPDATE
  Orders
SET
  Payment_ID = 122974
WHERE
  Customer_ID = 8651;

UPDATE
  Orders
SET
  Payment_ID = 67656
WHERE
  Customer_ID = 7929;

INSERT INTO
  Payment (Payment_ID, PaymentType, Order_ID)
VALUES
  (148333, 'COD', 20221),
  (87369, 'COD', 20223),
  (51779, 'COD', 20225),
  (122974, 'Cash', 20227),
  (67656, 'Cash', 20229);

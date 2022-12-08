 -- Query 1
SELECT
  Orders.Order_ID,
  Orders.ProductName,
  Customers.Customer_ID,
  CONCAT (Customers.CustomerFirstName, SPACE (1), Customers.CustomerLastName) AS CustomerName,
  Orders.OrderQuantity * Orders.OrderTotal AS TotalAmount,
  Payment.Payment_ID,
  Payment.PaymentType
FROM
  Orders
  LEFT JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
  LEFT JOIN Payment ON Orders.Payment_ID = Payment.Payment_ID
  AND Orders.Order_ID = Payment.Order_ID;

-- Query 2
SELECT
  Products.ProductName,
  Products.ProductPrice,
  Products.ProductQTY,
  Suppliers.Supplier_ID
FROM
  Products
  LEFT JOIN Suppliers ON Products.Supplier_ID = Suppliers.Supplier_ID;

-- Query 3
SELECT
  SUM(OrderQuantity * OrderTotal) AS TotalSales
FROM
  Orders;

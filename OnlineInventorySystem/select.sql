SELECT
  Orders.Order_ID,
  Orders.ProductName,
  Payment.Payment_ID
FROM
  Orders
  LEFT JOIN Payment ON Orders.Payment_ID = Payment.Payment_ID;

SELECT
  Products.ProductName,
  Products.ProductPrice,
  Suppliers.Supplier_ID
FROM
  Products
  LEFT JOIN Suppliers ON Products.Supplier_ID = Suppliers.Supplier_ID;

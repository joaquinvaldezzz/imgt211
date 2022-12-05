CREATE DATABASE Suppliers;

CREATE TABLE suppliers
(
  [supplier_id] INT IDENTITY (1, 1) PRIMARY KEY,
  [supplier_name] CHAR(64) NOT NULL,
  [contact_name] CHAR(64)
);

ALTER TABLE suppliers
  ADD [supplier_location] char(64);

-- INSERT INTO suppliers VALUES ('John Joaquin A. Valdez', )

SELECT *
FROM suppliers;

INSERT INTO suppliers
VALUES
  ('Supplier 01', 'John Joaquin A. Valdez', 'San Jose Del Monte, Bulacan');

INSERT INTO suppliers
VALUES
  ('Supplier 02', 'Christal Sofia D. Malbago', 'San Jose Del Monte, Bulacan'),
  ('Supplier 03', 'Ken Lorence Gara', 'Caloocan'),
  ('Supplier 04', 'John Arlou Pequino', 'Caloocan'),
  ('Supplier 05', 'Claire Samson', 'Caloocan');

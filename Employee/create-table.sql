CREATE DATABASE Employee;

CREATE TABLE
  Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(256),
    last_name VARCHAR(256),
    address VARCHAR(256),
    title VARCHAR(256),
    region VARCHAR(256),
    postal_code VARCHAR(256),
    country VARCHAR(256)
  );

CREATE TABLE
  Region (region_id VARCHAR(256) PRIMARY KEY, region_description VARCHAR(256));

CREATE TABLE
  Territories (
    territory_id INT PRIMARY KEY,
    territory_description VARCHAR(256),
    region_id VARCHAR(256) FOREIGN KEY REFERENCES Region (region_id)
  );

CREATE TABLE
  EmployeeTerritories (
    employee_id INT FOREIGN KEY REFERENCES Employees (employee_id),
    territory_id INT FOREIGN KEY REFERENCES Territories (territory_id),
  );

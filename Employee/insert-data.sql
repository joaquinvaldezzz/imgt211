INSERT INTO Employees
VALUES
  (1, 'John Joaquin', 'Valdez', 'San Jose Del Monte', 'Front-end Developer', 'Region 3', '3023', 'Philippines')

SELECT *
FROM Employees


INSERT INTO Region
VALUES
  (001, 'Region 3')

SELECT *
FROM Region

INSERT INTO Territories
VALUES(01, 'San Jose Del Monte', 001)

SELECT *
FROM Territories

INSERT INTO EmployeeTerritories
VALUES
  (1, 01)

SELECT *
FROM EmployeeTerritories

---

SELECT region
FROM
  Territories as T
  INNER JOIN Employees as E
  ON T.region_id = E.employee_id
  INNER JOIN EmployeeTerritories as ET
  ON T.territory_id = T.territory_id
  INNER JOIN Region as R
  ON R.region_id = T.region_id

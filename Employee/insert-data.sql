INSERT INTO
  Employees
VALUES
  (
    1,
    'John Joaquin',
    'Valdez',
    'San Jose Del Monte',
    'Front-end Developer',
    'Region 3',
    '3023',
    'Philippines'
  );

INSERT INTO
  Region
VALUES
  (001, 'Region 3');

INSERT INTO
  Territories
VALUES
  (01, 'San Jose Del Monte', 001);

INSERT INTO
  EmployeeTerritories
VALUES
  (1, 01);

SELECT
  region
FROM
  Territories AS T
  INNER JOIN Employees AS E ON T.region_id = E.employee_id
  INNER JOIN EmployeeTerritories AS ET ON T.territory_id = T.territory_id
  INNER JOIN Region AS R ON R.region_id = T.region_id;

CREATE DATABASE ORGDB1;
USE ORGDB1;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'John', 'Doe', 'HR', 50000, '2020-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000, '2018-03-12'),
(3, 'Sam', 'Brown', 'IT', 75000, '2019-05-22'),
(4, 'Lucy', 'Jones', 'HR', 53000, '2021-07-11'),
(5, 'Mike', 'Taylor', 'Finance', 65000, '2017-09-23'),
(6, 'Sara', 'Miller', 'IT', 78000, '2018-06-30');

-- COALESCE()
SELECT EmployeeID, FirstName, COALESCE(Salary, 0) AS SalaryOrZero FROM Employee;

-- NULLIF()
SELECT EmployeeID, FirstName, NULLIF(Salary, 60000) AS SalaryNullified FROM Employee;

-- CAST() AND CONVERT()
SELECT EmployeeID, FirstName,
    CAST(Salary AS CHAR) AS SalaryAsString,
    CONVERT(Salary, CHAR) AS SalaryAsStringConverted
FROM Employee;

SELECT CAST('100' AS UNSIGNED);
SELECT CAST(10 AS DECIMAL(5,2));

SELECT CONVERT(NOW(),CHAR);

-- IFNULL()
SELECT EmployeeID, FirstName, IFNULL(Salary, 0) AS SalaryIfNull FROM Employee;

-- TRIM(), LTRIM(), RTRIM()
SELECT TRIM('  HELLO  ');
SELECT LTRIM('  HELLO  ');
SELECT RTRIM('  HELLO  ');
SELECT EmployeeID,
    TRIM(FirstName) AS Trimmed,
    LTRIM(FirstName) AS LeftTrimmed,
    RTRIM(FirstName) AS RightTrimmed
FROM Employee;



--  GREATEST() and LEAST()
SELECT GREATEST(10,25,7,30);
SELECT LEAST(10,25,7,30);

SELECT EmployeeID, FirstName,SALARY,
    GREATEST(Salary, 60000) AS GreatestSalary,
    LEAST(Salary, 60000) AS LeastSalary
FROM Employee;

-- GROUP_CONCAT()
SELECT Department, GROUP_CONCAT(FirstName) AS EmployeesInDepartment
FROM Employee
GROUP BY Department;
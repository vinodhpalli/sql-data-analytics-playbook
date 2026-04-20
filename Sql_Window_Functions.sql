CREATE DATABASE ORGDB;
USE ORGDB;

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

SELECT * FROM Employee;

-- ROW_NUMBER

SELECT EmployeeID, FirstName, LastName, Department, Salary,
ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RowNum
FROM Employee;

-- RANK()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rankk
FROM Employee;

-- DENSE_ RANK()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DENSERankk
FROM Employee;

-- PERCENT_RANK()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
PERCENT_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS PercentRank
FROM Employee;

 -- NTILE()
 SELECT EmployeeID, FirstName, LastName, Department, Salary,
NTILE(2) OVER (PARTITION BY Department ORDER BY Salary DESC) AS Quartile
FROM Employee;

-- LEAD()
SELECT EmployeeID, FirstName, LastName, HireDate, Department, Salary,
LEAD(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS NextSalary
FROM Employee;

-- LAG()
SELECT EmployeeID, FirstName, LastName, HireDate, Department, Salary,
LAG(Salary) OVER (PARTITION BY Department ORDER BY HireDate) AS PrevSalary
FROM Employee;

-- FIRST_VALUE()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
FIRST_VALUE(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC) AS FirstSalary
FROM Employee;

-- LAST_VALUE()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
LAST_VALUE(Salary) OVER (
        PARTITION BY Department ORDER BY Salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS LastSalary
FROM Employee;

-- CUMULATIVE_DISTRUBUTION()
SELECT EmployeeID, FirstName, LastName, Department, Salary,
CUME_DIST() OVER (PARTITION BY Department ORDER BY Salary DESC) AS CumeDist
FROM Employee;
















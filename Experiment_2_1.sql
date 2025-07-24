USE ADBMS_2027;
SELECT name 
FROM sys.tables;
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL  -- Self-reference to EmpID
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);


-- Insert data into Employee table
INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        -- Top-level manager
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT * FROM EMPLOYEE;

-- SELF - JOIN
SELECT E1.EmpName AS [EMPLOYEE_NAME], E2.EmpName AS [MANAGER_NAME],
E1.Department AS [EMP_DEPT], E2.Department AS [MANAGER_DEPT]
FROM
Employee AS E1
INNER JOIN
Employee AS E2
ON 
E1.ManagerID = E2.EmpID;


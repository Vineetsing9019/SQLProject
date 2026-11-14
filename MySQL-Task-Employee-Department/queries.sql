-- MySQL Task: Employee & Department (I.T. Vedant, T232 / 9-11am / JFSD10)
-- Vineetsing Girase, 14 Nov 2026

-- Setup: database and Department table (dept_id in Employee is a FOREIGN KEY to it)
CREATE DATABASE `leave`;
USE `leave`;

CREATE TABLE department (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);
INSERT INTO department VALUES (1,'IT'),(2,'HR'),(3,'Finance'),(4,'Marketing'),(5,'Sales');
SELECT * FROM department;

-- Q1. Create an Employee table with constraints
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  salary DECIMAL(10,2) CHECK (salary > 0),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
DESC employee;

-- Q2. Insert employee details
INSERT INTO employee VALUES
(101,'Rahul Sharma','rahul@gmail.com',45000,1),
(102,'Vikas Patil','vikas@gmail.com',32000,2),
(103,'Amit Verma','amit@gmail.com',55000,1),
(104,'Suresh Joshi','suresh@gmail.com',28000,3),
(105,'Rohan Desai','rohan@gmail.com',40000,NULL),
(106,'Nikhil Kulkarni','nikhil@gmail.com',60000,3),
(107,'Karan Mehta','karan@gmail.com',35000,1),
(108,'Prakash Nair','prakash@gmail.com',25000,NULL);
SELECT * FROM employee;

-- Q3. Employees earning 30000 to 50000
SELECT * FROM employee WHERE salary BETWEEN 30000 AND 50000;

-- Q4. Increase the salary of all employees by 10%
UPDATE employee SET salary = salary * 1.10;
SELECT * FROM employee;

-- Q5. Employees in the IT department
SELECT * FROM employee
WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name = 'IT');

-- Q6. Employee names with department names (INNER JOIN)
SELECT e.emp_name, d.dept_name
FROM employee e INNER JOIN department d ON e.dept_id = d.dept_id;

-- Q7. All employees, including those with no department (LEFT JOIN)
SELECT e.emp_name, d.dept_name
FROM employee e LEFT JOIN department d ON e.dept_id = d.dept_id;

-- Q8. Departments that do not have any employees
SELECT d.dept_id, d.dept_name
FROM department d LEFT JOIN employee e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- Q9. Employees not assigned to any department
SELECT * FROM employee WHERE dept_id IS NULL;

-- Q10. Employees whose salary is greater than the average salary
SELECT * FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);

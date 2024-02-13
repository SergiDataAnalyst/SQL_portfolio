-- Basic Data Retrieval: Retrieve all employees in the Sales department
SELECT * FROM employees WHERE department = 'Sales';

-- Joining Tables: Show the names of employees along with their department names
SELECT employees.name, departments.name 
FROM employees 
JOIN departments ON employees.department_id = departments.id;

-- Aggregate Functions: Calculate the average salary by department
SELECT department, AVG(salary) AS average_salary 
FROM employees 
GROUP BY department;

-- Subqueries and Nested Selects: Find employees earning more than the company average
SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Data Manipulation: Insert, Update, and Delete operations
-- Insert a new employee
INSERT INTO employees (name, department, salary) 
VALUES ('John Doe', 'Marketing', 50000);

-- Give a raise to all employees in the Sales department
UPDATE employees 
SET salary = salary + 5000 
WHERE department = 'Sales';

-- Delete an employee
DELETE FROM employees 
WHERE name = 'John Doe';

-- Creating and Modifying Tables
-- Create a new table for projects
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Add a new column to the employees table
ALTER TABLE employees 
ADD COLUMN project_id INT;

-- Complex Joins and Case Statements: Determine the status of projects employees are working on
SELECT employees.name, 
       CASE 
           WHEN projects.end_date IS NULL THEN 'Ongoing' 
           ELSE 'Completed' 
       END AS project_status 
FROM employees 
LEFT JOIN projects ON employees.project_id = projects.id;

-- Window Functions: Rank employees by their salary
SELECT name, salary, 
       RANK() OVER (ORDER BY salary DESC) salary_rank 
FROM employees;

-- Handling Date and Time: Calculate the number of years each employee has been with the company
SELECT name, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_with_company 
FROM employees;

-- Complex Queries Involving Multiple Operations: Find departments with above-average salaries and more than 5 employees
SELECT department, AVG(salary) as average_salary, COUNT(*) as number_of_employees
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
GROUP BY department
HAVING COUNT(*) > 5;

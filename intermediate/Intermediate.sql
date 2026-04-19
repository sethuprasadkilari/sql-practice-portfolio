/* =======================
   INTERMEDIATE SQL PRACTICE
   ======================= */

-- Preview tables
SELECT * FROM employeetb;
SELECT * FROM companytb;
SELECT * FROM departmenttb;

-- ⚠️ Safer practice: avoid disabling safe updates globally
-- SET SQL_SAFE_UPDATES = 0;

-- Q1: All rows from department table
SELECT *
FROM departmenttb;

-- Q2: Update department name where id = 1
-- (Preview before update)
SELECT *
FROM departmenttb
WHERE id = 1;

UPDATE departmenttb
SET name = 'Management'
WHERE id = 1;

-- Q3: Delete employees with salary > 100000
-- (Preview before delete)
SELECT *
FROM employeetb
WHERE salary > 100000;

DELETE FROM employeetb
WHERE salary > 100000;

-- Q4: Names of companies
SELECT DISTINCT name AS company_name
FROM companytb;

-- Q5: Name and city of every employee
SELECT 
    name AS emp_name,
    city
FROM employeetb;

-- Q6: Companies with revenue > 5,000,000
SELECT 
    name AS company_name
FROM companytb
WHERE revenue > 5000000;

-- Q7: Companies with revenue < 5,000,000
SELECT 
    name AS company_name
FROM companytb
WHERE revenue < 5000000;

-- Q8: Companies with revenue < 5,000,000 (without '<')
SELECT 
    name AS company_name
FROM companytb
WHERE revenue BETWEEN 0 AND 4999999;

-- Q9: Employees with salary between 50,000 and 70,000 (inclusive)
SELECT 
    name AS emp_name
FROM employeetb
WHERE salary BETWEEN 50000 AND 70000;

-- Q10: Same as Q9 without BETWEEN
SELECT 
    name AS emp_name
FROM employeetb
WHERE salary >= 50000
  AND salary <= 70000;

-- Q11: Employees with salary = 80,000
SELECT 
    name AS emp_name
FROM employeetb
WHERE salary = 80000;

-- Q12: Employees with salary != 80,000
SELECT 
    name AS emp_name
FROM employeetb
WHERE salary <> 80000;

-- Q13: Unique department names
SELECT DISTINCT name AS department_name
FROM departmenttb;

-- Q14: Employee name with department_id (no JOIN)
SELECT 
    name AS emp_name,
    department_id
FROM employeetb;

-- Q15: Employee name with department name (using JOIN)
SELECT 
    e.name AS emp_name,
    d.name AS department_name
FROM employeetb e
LEFT JOIN departmenttb d
    ON e.department_id = d.id;

-- Q16: Every company with every department (Cartesian product)
SELECT 
    c.name AS company_name,
    d.name AS department_name
FROM companytb c
CROSS JOIN departmenttb d;

-- Q17: Employee with departments they are NOT working in
SELECT 
    e.name AS emp_name,
    d.name AS department_name
FROM employeetb e
CROSS JOIN departmenttb d
WHERE e.department_id <> d.id;

-- Q18: Rename column as 'Company'
SELECT 
    name AS company
FROM companytb;

-- Q19: City-wise max salary
SELECT 
    city,
    MAX(salary) AS max_salary
FROM employeetb
GROUP BY city;

-- Q20: Company with highest revenue
SELECT 
    name AS company_name
FROM companytb
WHERE revenue = (
    SELECT MAX(revenue)
    FROM companytb
);
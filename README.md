# SQL Practice Portfolio 

This repository contains SQL practice problems categorized into:

## 🟢 Basic
- Aggregations (COUNT, SUM)
- Filtering (WHERE)
- Group By & Having

## 🟡 Intermediate
- Joins (INNER, LEFT, CROSS)
- Conditions & filtering
- Subqueries

## 🔴 Advanced
- Window Functions (ROW_NUMBER, RANK, DENSE_RANK)
- Ranking problems
- Analytical queries

## 💡 Example Query

Find 2nd highest salary per department:

```sql
SELECT emp_name, dept, salary
FROM (
  SELECT emp_name, dept, salary,
         DENSE_RANK() OVER (PARTITION BY dept ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 2;

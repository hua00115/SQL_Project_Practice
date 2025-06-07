


# CTE -- Common table expressions
# CTE works very similar with subqueries, as you perform aggregation after the first step. But its more organised and easy to read + it comes before from. 
# WITH... AS(...)
# It can be used immediately right after the CTE, but its not acting like a function which can be reuse.

# Exp1
WITH CTE_Example AS (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
ON dem. employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG (avg_sal)
FROM CTE_Example
;


# Exp2
WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example. employee_id = CTE_Example2. employee_id
;
    
# Exp3
WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS  # We can just put the columns name at here if we dont wanna use AS at the bottom.
(
SELECT gender, AVG(salary) , MAX(salary) , MIN(salary) , COUNT(salary) 
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
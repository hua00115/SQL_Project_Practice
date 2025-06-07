
# Subqueries -- A queries within a queries

SELECT * , "PARK and RECREATION" AS Department
FROM employee_demographics AS demographic
WHERE demographic.employee_id IN(  # Here is when subqueries begin. when you wanna access to data from other tables, but do not really wanna join two tables together. cant include two columns
	SELECT employee_id FROM employee_salary
	WHERE employee_salary.dept_id=1
		
)
;

SELECT CONCAT(first_name,last_name), salary,
(SELECT AVG(salary) FROM employee_salary) AS AVG_salary # subqueries
FROM employee_salary
;


SELECT AVG(max_age)
FROM (
  SELECT 
    gender,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age,
    COUNT(age) AS count_age
  FROM employee_demographics
  GROUP BY gender
) AS Agg_table;
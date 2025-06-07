
# Joins -- allow you to join two tables with similar columns
# LEFT JOIN -- Takes everything from A even if the element is not existing in B (Will be replacw with null)
# RIGHT JOIN
# OUTER JOIN

SELECT * 
FROM employee_demographics
;

SELECT * 
FROM employee_salary
;

# EXP 1: Inner join (By default in join)
SELECT * 
FROM employee_demographics	AS dem
JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;
# Only gonna bring the rows with similar valie in the selected join. 


# EXP 2: LEFT join 
SELECT * 
FROM employee_demographics	AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;
# First extract everything from A, and only extract matching item from B. (Expected null)


# EXP 3: RIGHT join 
SELECT * 
FROM employee_demographics	AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id=sal.employee_id
;
# First extract everything from B, and only extract matching item from A. (Expected null)


# EXP 4:  SELF join -- you are joining a table to itself
SELECT 
emp1.employee_id AS emp_santa, 
emp1. first_name AS first_name_santa, 
emp1. last_name AS last_name_santa, 
emp2. employee_id AS emp_name, 
emp2. first_name AS first_name_emp, 
emp2. last_name As last_name_emp
FROM employee_salary AS emp1
JOIN
employee_salary AS emp2
	ON emp1. employee_id + 1 = emp2.employee_id   # Join to itself
;

# Exp 5: Joining multiple tables

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;
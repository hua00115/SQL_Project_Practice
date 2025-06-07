
# Unions -- allow you to join two tables with rows

#Exp1: UNION (Default)
SELECT first_name, last_name 
FROM employee_demographics
UNION # The default setting of UNION is "UNION DISTINCT" ie: Remove duplicate rows
SELECT first_name, last_name  
FROM employee_salary
;

#Exp2: UNION ALL
SELECT first_name, last_name 
FROM employee_demographics
UNION ALL# With UNION ALL, we will include everything eventhough they are duplicate
SELECT first_name, last_name  
FROM employee_salary
;

#Exp3: UNION cases
SELECT first_name, last_name , "Old Man" AS Label
FROM employee_demographics
WHERE age>40 AND gender="Male"
UNION 
SELECT first_name, last_name , "Old Lady" AS Label
FROM employee_demographics
WHERE age>40 AND gender="Fenale"
UNION
SELECT first_name, last_name  , "Highly Paid Employees" AS Label
FROM employee_salary
WHERE salary>50000
ORDER BY first_name, last_name # When dealing with sorting, we always use order by.
;



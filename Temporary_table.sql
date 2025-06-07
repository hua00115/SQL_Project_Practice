

# Temporary Table -- Temp table
# For storing intermediate result from complex queries
# the temp table only last as long as you are still in the section/other scripts. But it will disepear after closing Mysql



CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;
 
 
SELECT *
FROM employee_salary;
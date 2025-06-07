SELECT * 
FROM Parks_and_Recreation.employee_demographics;

SELECT occupation # one column
FROM Parks_and_Recreation.employee_salary;

SELECT *
FROM Parks_and_Recreation.employee_salary;

SELECT DISTINCT # remove duplicate
occupation,   # For columns
salary
FROM Parks_and_Recreation.employee_salary;

SELECT DISTINCT
gender
FROM Parks_and_Recreation.employee_demographics;

SELECT 
    COUNT(*) AS total_employees,
    MAX(age) AS oldest,
    MIN(age) AS youngest
FROM employee_demographics;

# SELECT           -- can be columns or everything
# SELECT DISTINCT  -- equivalence to unique()
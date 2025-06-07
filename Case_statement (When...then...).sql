
# Case statements
# works similar as if statement in python


SELECT
CONCAT(first_name,last_name), age,
CASE
	WHEN age <=40 THEN "YOUNG" 
    WHEN age BETWEEN 40 AND  60 THEN "Middle Age" 
    WHEN age >=60 THEN "OLD" 
END AS Status
FROM employee_demographics
;


SELECT CONCAT(first_name,last_name) , salary AS previous_salary, department_name,
(CASE
	WHEN salary <50000 THEN salary*1.05 
    ELSE salary * 1.07
End 
+
CASE
	WHEN department_name = "Finance" THEN salary * 1.1
    ELSE 0
End) AS Pay_Increases
FROM employee_salary AS salary
LEFT JOIN parks_departments AS department
	ON salary.dept_id = department.department_id
;


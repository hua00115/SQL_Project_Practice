
# Window Function - PARTITION BY GROUP
# ...OVER(PARTITION BY.....)


SELECT gender, AVG(salary) OVER(PARTITION BY gender)
FROM
employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id =sal.employee_id
;

# Unlike Group BY, the returned tables wont compressed into selected group, but the complete group + (the aggregation that apply to each distinct group)




SELECT 
CONCAT(first_name,last_name) AS full_name,
gender,
salary,
avg_salary_gender,
salary - avg_salary_gender AS Cost
FROM (SELECT dem.first_name, dem.last_name, gender,
salary,
AVG(salary) OVER(PARTITION BY gender) AS avg_salary_gender
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
) AS emp
ORDER BY gender, Cost DESC
;




# Rolling Total
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total # We can add orderby if we wanna sort the order after the partitioning
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem. employee_id = sal.employee_id
;


# ROW_NUMBER(), RANK_NUMBER(), DENSE_RANK()
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_rank_num
FROM employee_demographics dem
JOIN  employee_salary sal
	ON dem. employee_id = sal.employee_id;


# ROW_NUMBER()  - return the number in index, from the partitioning group
# RANK_NUMBER() - return the number in index, from the partitioning group, and if the value is similar based on the ORDER BY column, then the index will be similar. (But have to remeber that the next index will depends on POSITION)
# DENSE_RANK()  - return the number in index, from the partitioning group, and if the value is similar based on the ORDER BY column, then the index will be similar. (But have to remeber that the next index will CONTINUE)

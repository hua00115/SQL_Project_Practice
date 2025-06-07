
# Having vs Where

SELECT 
*
from employee_demographics
;

# Exp 1 - with where
SELECT 
gender,
AVG(age)
from employee_demographics
WHERE age > 40
GROUP BY gender
;
# Used to filter before the grouped result

# Exp 2 - with having
SELECT 
gender,
AVG(age)
from employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;
## Having only pair with Group By, and it allows aggregate function. It only apply after the grouping. (ie: use to filter the grouped result)



#Exp 3 - with where and having

SELECT 
occupation,
AVG(salary) AS average_salary
FROM employee_salary
Where occupation LIKE '%manager%'
GROUP BY occupation
Having average_salary >70000




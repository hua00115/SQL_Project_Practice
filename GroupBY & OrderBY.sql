

# Group by Statement  - gathered rows with similar selected columns
# Order BY - asdc/desc

SELECT * 
from employee_demographics
;

#Exp 1
SELECT 
gender
from employee_demographics
GROUP BY gender
;

#Exp 2
SELECT 
gender,
AVG(age)
from employee_demographics
GROUP BY gender
;

#Exp 3
SELECT * 
from employee_salary
;

#Exp 4 : return the result from two group by eventhough the occupation is similar, but salary could be different
SELECT 
occupation,
salary
from employee_salary
GROUP BY occupation, salary
;

# Exp 5
SELECT 
gender,
AVG(age),
COUNT(gender)
from employee_demographics
GROUP BY gender
;


## The selected columns must match by the groupby columns if no aggregate function (avg, min, max, etc) is conducted.




# Order BY

SELECT * 
from employee_demographics
;

# Exp1
SELECT * 
from employee_demographics
ORDER BY first_name
;

# Exp 2
SELECT * 
from employee_demographics
ORDER BY first_name DESC
;

# Exp 3
SELECT * 
from employee_demographics 
ORDER BY gender,age 
;

# Exp 4
SELECT * 
from employee_demographics
ORDER BY gender,age DESC # We can just decended the age as its happening after the ,
;


## Which one u wanna order by first is very important. if you order by age first then the gender columns wont be alligns as there may be less common age, and it also distributed equaly among all gender.
# Exp 5 - as examplke for the above statement
SELECT * 
from employee_demographics
ORDER BY age DESC, gender
;
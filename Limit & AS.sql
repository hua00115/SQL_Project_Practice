

# Limit & Aliasing

## Limit
# Exp 1
SELECT * 
FROM employee_demographics
LIMIT 3 # only extract the first three rows
;

# Exp 2 - second use with comma
SELECT * 
FROM employee_demographics
LIMIT 2,1 # only extract the third row (cos we ignore the first 2, then comma then 1)
;



## Aliasing (AS).  # Used to change the name of the columns


SELECT gender, AVG(age) AS average_age
FROM employee_demographics
GROUP BY gender
HAVING average_age >40
;

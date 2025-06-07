

# Where Statement
SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE 
(salary >60000 AND dept_id=1)  # condition.  Strings and dates need to have " "
AND NOT
occupation = "City Manager"
;




# Like Statement     -- We are looking forward to some match
# 1) % 
SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE first_name lIKE "Jer%"  # The % means there is stg continuing after Jer, thus it will return everything that start with Jer.
OR
first_name lIKE "%hri%"  # The % means there is stg continuing before and after hri, thus it will return everything that contain hri.
;

# 2) _ 
SELECT *
FROM Parks_and_Recreation.employee_salary
WHERE first_name lIKE "Jer__"  # The _ means how many characters are remainning
;



# Logical operator
# WHERE  - Conditional statement
# AVG()
# COUNT()  - Usually paired with group by
# SUM()
# !=
# >
# <
# AND    - can pair with NOT= AND NOT
# OR     - can pair with NOT= OR NOT
# NOT
# LENGTH()
# UPPER()
# LOWER()
# TRIM()
# RTRIM()
# LTRIM()
# LEFT(  , 4) 
# RIGHT(  , 4)
# SUBSTRING(selected_column,strating point,how many characted wanted to include)
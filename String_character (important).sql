

# String Function

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name)
;

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

SELECT first_name, LOWER(first_name)
FROM employee_demographics
;

SELECT first_name, TRIM("   HI     ") # TRIM() remove all the spaces before and after the character
FROM employee_demographics
;

SELECT first_name, LTRIM("   HI     ") # TRIM() remove all the spaces before the character
FROM employee_demographics
;

SELECT first_name, RTRIM("   HI     ") # TRIM() remove all the spaces  the character
FROM employee_demographics
;

SELECT first_name, LEFT(first_name,3) # SLICE/EXTRACT ONLY THE FIRST 3 CHARACTERS STARTING FROM LEFT
FROM employee_demographics
;

SELECT first_name, RIGHT(first_name,3) # SLICE/EXTRACT ONLY THE FIRST 3 CHARACTERS STARTING FROM RIGHT
FROM employee_demographics
;

SELECT first_name, SUBSTRING(birth_date,6,2) # substring perform slice on the selected columns. Every rows in the selected columns is affected. 6 is the starting point, and two is how many characted wanted to include.
FROM employee_demographics
;

SELECT first_name, REPLACE(first_name,"e","a") # select the column you wanted to execut
FROM employee_demographics
;

SELECT first_name, LOCATE("e",first_name) # return the location of the selected character. can be used on single words too.
FROM employee_demographics
;

SELECT first_name, last_name,
CONCAT(first_name, last_name) AS full_name # CONCAT merge two columns into one
FROM employee_demographics
;



# LENGTH() -- retun the number of characters
# UPER()   -- uppercase
# LOWER(). -- lowercase
# TRIM()  -- remove all the spaces before and after the character
# LTRIM()
# RTRIM()
# LEFT(selected_column, 4) -- SLICE/EXTRACT ONLY THE FIRST 3 CHARACTERS STARTING FROM LEFT
# RIGHT(selected_column, 4) -- SLICE/EXTRACT ONLY THE FIRST 3 CHARACTERS STARTING FROM RIGHT
# SUBSTRING(selected_column,strating point,how many characted wanted to include)
# REPLACE(selected_column,"characters you wanna replace","replace with...")
# LOCATE("check character",selected column/words)
# CONCAT(,) used to merge two or more columns into one
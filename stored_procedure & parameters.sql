
# Stored procedure -- Way to save your sql code and reuse it over and over again.


CREATE PROCEDURE large_salaries()
SELECT * FROM employee_salary
WHERE salary>=50000
;


# To use:
CALL large_salaries();


# Exp 2
DELIMITER $$.   # We can use DELIMITER _anysymbol_ to set a store procedure even if there is more than one statements. ; will be use as separate output table 
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$  # Use the selected symbol to close it
DELIMITER ;   # At the end, we have to set it back to normal delimiter

CALL large_salaries3()





# Exp 3 -- with parameters

DELIMITER $$
CREATE PROCEDURE large_salaries4(name VARCHAR(10)) # When the parameter is string
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE first_name = name ;
END $$
DELIMITER ;
CALL large_salaries4("Ann");

DELIMITER $$
CREATE PROCEDURE large_salaries5(id INT) # When the parameters is number
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = id
	;
END $$
DELIMITER ;
CALL large_salaries5(1);




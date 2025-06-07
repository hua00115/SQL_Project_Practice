

# Triggers and Events


# TRIGGERS. - will take place when an event happens
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary    # can be after or before. Based on case
	FOR EACH ROW   # It means every new row, will trigger this code
BEGIN
	INSERT INTO employee_demographics (employee_id,first_name,last_name)
	VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO',1000000, NULL);


SELECT * FROM employee_salary;
SELECT * FROM employee_demographics
;




# EVENTS - will take place after schedulling it

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND    # can be 1 month, 1 day,...
DO
BEGIN
	DELETE
	FROM employee_demographics
	WHERE age >= 60;
END $$

DELIMITER ;
SHOW VARIABLES LIKE 'event%';


SELECT * FROM employee_demographics





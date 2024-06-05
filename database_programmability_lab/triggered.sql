CREATE TABLE deleted_employees(
	employee_id SERIAL PRIMARY KEY, 
	first_name varchar(20), 
	last_name varchar(20), 
	middle_name varchar(20), 
	job_title varchar(50), 
	department_id int, 
	salary numeric (19,4)
);

CREATE OR REPLACE FUNCTION backup_fired_emp()
RETURNS TRIGGER
AS
$$
	BEGIN
		INSERT INTO deleted_employees(
			first_name, last_name, middle_name, job_title, department_id, salary
		)
		VALUES (
			old.first_name, 
			old.last_name, 
			old.middle_name, 
			old.job_title, 
			old.department_id, 
			old.salary
		);
		RETURN new;
	END;
$$
LANGUAGE plpgsql
;

CREATE OR REPLACE trigger backup_employees
AFTER DELETE on employees
FOR EACH ROW 
EXECUTE PROCEDURE backup_fired_emp();

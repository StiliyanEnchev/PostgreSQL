DELETE FROM volunteers
WHERE department_id = (
	select id 
		from volunteers_departments
			WHERE department_name = 'Education program assistant' 
);

DELETE FROM volunteers_departments 
	WHERE department_name = 'Education program assistant';

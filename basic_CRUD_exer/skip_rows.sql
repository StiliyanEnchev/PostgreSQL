SELECT 
	id,
	CONCAT(
		first_name,
		' ',
		middle_name,
		' ',
		last_name
	) AS full_name,
	hire_date
FROM employees
ORDER by hire_date
OFFSET 9
SELECT 
	COUNT(*)
FROM 
	employees
WHERE salary > (SELECT AVG(salary) from employees)

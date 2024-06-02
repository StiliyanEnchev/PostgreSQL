SELECT 
	employee_id,
	CONCAT(first_name, ' ', last_name) as full_name,
	ep.project_id,
	p.name
FROM 
	employees as e
		join employees_projects as ep 
			USING (employee_id)
				join projects as p
					ON ep.project_id = p.project_id
WHERE p.project_id = 1

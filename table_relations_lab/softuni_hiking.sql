SELECT 
	r.start_point,
	r.end_point,
	leader_id,
	CONCAT(c.first_name, ' ', c.last_name)
FROM 
	routes as r
		JOIN campers as c
			ON c.id = r.leader_id

SELECT 
	o.name as owner,
	count(*) as count_of_animals
	FROM 
owners as o
join animals as a
	on a.owner_id = o.id
GROUP BY 
	o.name
ORDER BY
	count_of_animals DESC, o.name
LIMIT 5

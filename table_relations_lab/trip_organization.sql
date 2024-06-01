SELECT 
	driver_id,
	vehicle_type,
	concat(first_name, ' ', last_name)
FROM vehicles as v
		join campers as c
			ON c.id = v.driver_id

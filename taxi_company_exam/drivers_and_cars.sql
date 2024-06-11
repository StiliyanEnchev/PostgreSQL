SELECT 
	d.first_name, d.last_name, c.make, c.model, c.mileage
FROM 
	cars as c
		join cars_drivers as cd
			on cd.car_id = c.id 
				join drivers as d
					on d.id = cd.driver_id
WHERE c.mileage IS NOT NULL
ORDER BY 
	c.mileage DESC, d.first_name

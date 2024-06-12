SELECT 
	ad.name as address,
	CASE 
		WHEN extract(hour from cr.start) between 6 and 20
			THEN 'Day'
		ELSE 
			'Night'
	END AS day_time,
	cr.bill,
	cl.full_name,
	crs.make,
	crs.model,
	ct.name as category_name
FROM
	courses as cr
		join addresses as ad
			on cr.from_address_id = ad.id
				join cars as crs
					ON crs.id = cr.car_id
					join categories as ct 
						ON ct.id = crs.category_id
							join clients as cl
								ON cl.id = cr.client_id
ORDER BY 
	cr.id

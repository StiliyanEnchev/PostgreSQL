SELECT 
	cr.id as car_id,
	cr.make,
	cr.mileage,
	count(co.id) as count_of_courses,
	ROUND(avg(co.bill), 2) as average_bill
FROM 
	cars as cr
		left join courses as co
			on cr.id = co.car_id
GROUP BY 
	cr.id
HAVING 
	count(co.id) <> 2
ORDER BY 
	count_of_courses DESC, cr.id 

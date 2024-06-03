SELECT 
	b.apartment_id,
	b.booked_for,
	c.first_name,
	c.country 
FROM 
	customers as c
		join bookings as b
			using(customer_id)
WHERE c.job_type = 'Lead'

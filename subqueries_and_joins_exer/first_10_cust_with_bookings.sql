SELECT 
	b.booking_id,
	b.starts_at::date,
	b.apartment_id,
	CONCAT (c.first_name, ' ', c.last_name) as customer_name
FROM 
	bookings AS b
RIGHT JOIN 
	customers as c
		USING (customer_id)
ORDER BY 
	customer_name
LIMIT 10

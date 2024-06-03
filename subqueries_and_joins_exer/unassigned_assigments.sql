SELECT 
	b.booking_id,
	c.first_name as customer_name
FROM 
	bookings as b,
	customers as c
ORDER BY
	customer_name

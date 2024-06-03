SELECT 
	b.booking_id,
	b.apartment_id,
	c.companion_full_name
FROM 
	customers as c
		join bookings as b
			using (customer_id)
WHERE apartment_id is null

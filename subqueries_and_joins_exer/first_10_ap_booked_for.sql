SELECT 
	a.name,
	a.country,
	DATE(b.booked_at) as booked_at
FROM 
	apartments as a
		LEFT JOIN bookings as b
			USING (booking_id)
ORDER BY
	a.apartment_id
LIMIT 10

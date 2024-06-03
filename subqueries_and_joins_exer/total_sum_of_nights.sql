SELECT 
	a.name,
	SUM(b.booked_for)
FROM 
	apartments as a
		JOIN bookings as b
			using (apartment_id)
GROUP BY 
	a.name
ORDER BY
	a.name

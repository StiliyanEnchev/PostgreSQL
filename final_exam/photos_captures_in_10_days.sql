SELECT 
	CASE 
		WHEN description is null THEN '...'
		ELSE 
			CONCAT(left(description, 10) || '...') END as summary,
	to_char(capture_date, 'DD.MM HH24:MI') as "date"
FROM 	
	photos
WHERE 
	EXTRACT(day from capture_date) = 10
ORDER BY 
	capture_date DESC

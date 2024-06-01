SELECT 
	COUNT(*) as countries_without_rivers
FROM 
	countries
LEFT JOIN 
	countries_rivers
USING 
	(country_code)
WHERE 
	river_id IS NULL;

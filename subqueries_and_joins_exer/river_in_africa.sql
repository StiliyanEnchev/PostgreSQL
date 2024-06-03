SELECT 
	c.country_name,
	r.river_name
FROM 
	countries as c
LEFT JOIN countries_rivers as cr
	using (country_code)
LEFT JOIN 
	rivers as r
on r.id = cr.river_id
WHERE c.continent_code = 'AF'
ORDER BY
	c.country_name
LIMIT 5

SELECT 
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM 
	mountains_countries as mc
JOIN mountains as m 
	ON m.id = mc.mountain_id
JOIN peaks as p
	on m.id = p.mountain_id
WHERE mc.country_code = 'BG' 
		and
	p.elevation > 2835
ORDER BY 
	p.elevation DESC

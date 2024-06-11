UPDATE 
	cars
SET 
	condition = 'C'
WHERE 
	(mileage >= 800000 or mileage IS NULL)
		and
	year <= 2010
		and 
	make <> 'Mercedes-Benz';


CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50));

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
	address_name VARCHAR(100)
)
AS
$$
BEGIN 
	TRUNCATE search_results ;
	INSERT INTO search_results (address_name, full_name, level_of_bill, make, condition, category_name)
	SELECT 
		ad.name,
		cl.full_name,
		CASE 
			WHEN cr.bill <= 20 THEN 'Low'
			WHEN cr.bill <= 30 THEN 'Medium'
			ELSE 'High'
			END AS level_of_bill,
		crs.make,
		crs.condition,
		ct.name
	FROM
	courses as cr
		join addresses as ad
			on cr.from_address_id = ad.id
				join cars as crs
					ON crs.id = cr.car_id
					join categories as ct 
						ON ct.id = crs.category_id
							join clients as cl
								ON cl.id = cr.client_id
		WHERE address_name = ad.name
		order by crs.make, cl.full_name;
END;
$$
LANGUAGE plpgsql;

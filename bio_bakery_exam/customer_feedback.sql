CREATE OR REPLACE FUNCTION fn_feedbacks_for_product(
	product_name VARCHAR(25)
) RETURNS table (customer_id INT, customer_name VARCHAR(72), feedback_description VARCHAR(255), feedback_rate NUMERIC(4, 2))
AS
$$	
BEGIN
	RETURN query
	SELECT
		fb.customer_id,
		cs.first_name as customer_name,
		fb.description as feedback_description,
		fb.rate as feedback_rate
	FROM 
		products as pr
			join feedbacks as fb
				on pr.id = fb.product_id
					join customers as cs
						on cs.id = fb.customer_id
WHERE
	pr.name = product_name
ORDER BY 
	cs.id;
END;
$$
LANGUAGE plpgsql;

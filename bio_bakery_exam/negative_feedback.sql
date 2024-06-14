SELECT 
	fb.product_id,
	fb.rate,
	fb.description,
	cs.id as customer_id,
	cs.age,
	cs.gender
FROM 
	feedbacks as fb
		join customers as cs
			on fb.customer_id = cs.id
WHERE 
	cs.gender = 'F'
		AND
	fb.rate < 5.0
		AND
	cs.age > 30
ORDER BY 
	fb.product_id DESC

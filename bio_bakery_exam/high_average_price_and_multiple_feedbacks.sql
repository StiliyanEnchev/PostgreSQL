SELECT 
	pr.name as product_name,
	ROUND(AVG(pr.price), 2) as average_price,
	COUNT(*) as total_feedbacks
FROM 
	products as pr
		join feedbacks as fb
			on pr.id = fb.product_id
WHERE 
	pr.price > 15
GROUP BY
	product_name
HAVING 
	COUNT(*) > 1
ORDER BY 
	total_feedbacks, average_price DESC


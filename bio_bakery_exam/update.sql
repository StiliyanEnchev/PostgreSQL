UPDATE products 
	SET price = price * 1.10
FROM feedbacks
WHERE 
	products.id = feedbacks.product_id 
	and 
	feedbacks.rate > 8

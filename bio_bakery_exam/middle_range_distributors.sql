SELECT 
	ds.name as distributor_name,
	ing.name as ingredient_name,
	pr.name as product_name,
	AVG(fb.rate) as average_rate
FROM 
	ingredients as ing
		join products_ingredients  as pring
			on ing.id = pring.ingredient_id
				join products as pr
					on pr.id = pring.product_id
						join distributors as ds
							on ds.id = ing.distributor_id
								join feedbacks as fb
									on fb.product_id = pr.id
GROUP BY 
	distributor_name, ingredient_name, product_name
HAVING 
	AVG(fb.rate) between 5 and 8
ORDER BY 
	distributor_name, ingredient_name, product_name

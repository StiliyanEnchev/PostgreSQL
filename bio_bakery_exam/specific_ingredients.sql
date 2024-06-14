SELECT 
	ing.name as ingredient_name,
	pr.name as product_name,
	ds.name as distributor_name
FROM 
	ingredients as ing
		join products_ingredients  as pring
			on ing.id = pring.ingredient_id
				join products as pr
					on pr.id = pring.product_id
						join distributors as ds
							on ds.id = ing.distributor_id
WHERE	
	ds.country_id = 16
		and
	ing.name ilike '%Mustard%'
ORDER BY 
	product_name

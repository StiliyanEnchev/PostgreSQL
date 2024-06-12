SELECT 
	cl.full_name,
	count(*) as count_of_cars,
	sum(co.bill) as total_sum
FROM 
	clients as cl
		join courses as co
			on cl.id = co.client_id
GROUP BY
	cl.full_name
HAVING count(*) > 1
	AND	
	cl.full_name like '_a%'
ORDER BY 
		cl.full_name

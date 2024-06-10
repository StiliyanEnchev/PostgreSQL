SELECT v.name as volunteers,
	v.phone_number,
	substring(trim(replace(v.address, 'Sofia', '')), 3) as address
	FROM volunteers as v
		join volunteers_departments as vd
			on v.department_id = vd.id
WHERE v.address LIKE '%Sofia%'
		and
	vd.department_name = 'Education program assistant'
order by
	v.name

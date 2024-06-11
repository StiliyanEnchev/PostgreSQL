CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(
	searched_volunteers_department VARCHAR(30)
) RETURNS int 
AS
$$
	DECLARE 
	volunteers int;
BEGIN
	SELECT 
		count(*) into volunteers
	FROM 
		volunteers as v
			join volunteers_departments as vd
				on v.department_id = vd.id
	WHERE vd.department_name = searched_volunteers_department;
	RETURN volunteers;
END;
$$
LANGUAGE plpgsql
;

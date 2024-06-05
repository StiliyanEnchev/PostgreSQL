CREATE OR REPLACE FUNCTION fn_calculate_future_value(
	initial_sum int,
	yearly_interest_rate decimal,
	number_of_years int
)
RETURNS decimal
	AS
$$ 
	BEGIN
		RETURN TRUNC(
		initial_sum * POWER(1 + yearly_interest_rate, number_of_years),
		4);
	END;
$$
LANGUAGE plpgsql

WITH cte AS
(
	SELECT
		YEAR(date) AS year,
        SUM(amount) AS revenue
	FROM orders
    GROUP BY year
)
SELECT
	year,
    revenue,
    LAG(revenue) OVER(ORDER BY year) AS previous_year_revenue,
    revenue - LAG(revenue) OVER(ORDER BY year) AS revenue_difference,
    CONVERT((
		(
			revenue - LAG(revenue) OVER(ORDER BY year)
		) / LAG(revenue) OVER(ORDER BY year) *100
	), DECIMAL(10,2)) AS revenue_difference_precentage
FROM cte

/*
*/
























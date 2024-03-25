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
| Year | Revenue    | Previous Year Revenue | Revenue Difference | Revenue Difference Percentage |
|------|------------|-----------------------|--------------------|-------------------------------|
| 2018 | 110626690  | null                  | null               | null                          |
| 2019 | 249132001  | 110626690             | 138505311          | 125.20                        |
| 2020 | 162174893  | 249132001             | -86957108          | -34.90                        |
| 2021 | 282142344  | 162174893             | 119967451          | 73.97                         |
| 2022 | 396372938  | 282142344             | 114230594          | 40.49                         |
| 2023 | 463983061  | 396372938             | 67610123           | 17.06                         |

*/
























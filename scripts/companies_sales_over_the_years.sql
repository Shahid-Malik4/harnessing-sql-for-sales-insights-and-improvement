/*
Question: Companies sales difference over the year?
*/

WITH cte AS
(
	SELECT
		c.name AS company,
        od.total AS total,
        YEAR(o.date) AS year
	FROM orderdetails od
    INNER JOIN orders o ON od.invno = o.invno
    INNER JOIN items i ON od.itemno = i.itemno
    INNER JOIN companies c ON i.company = c.name
)
SELECT
	company,
    	CEIL(SUM(CASE WHEN year = 2018 THEN total ELSE 0 END)) AS 2018y,
	CEIL(SUM(CASE WHEN year = 2019 THEN total ELSE 0 END)) AS 2019y,
	CEIL(SUM(CASE WHEN year = 2020 THEN total ELSE 0 END)) AS 2020y,
	CEIL(SUM(CASE WHEN year = 2021 THEN total ELSE 0 END)) AS 2021y,
	CEIL(SUM(CASE WHEN year = 2022 THEN total ELSE 0 END)) AS 2022y,
	CEIL(SUM(CASE WHEN year = 2023 THEN total ELSE 0 END)) AS 2023y
FROM cte
GROUP BY company
ORDER BY 2023y DESC
LIMIT 10;


/*
| Company      | 2018y    | 2019y    | 2020y    | 2021y    | 2022y    | 2023y    |
|--------------|----------|----------|----------|----------|----------|----------|
| Staples      | 33035040 | 29547602 | 28931044 | 28745671 | 28133305 | 27289976 |
| Target       | 29547602 | 33035040 | 29547602 | 28931044 | 28745671 | 28133305 |
| IKEA         | 28931044 | 29547602 | 33035040 | 29547602 | 28931044 | 28745671 |
| Crayola      | 28745671 | 28931044 | 29547602 | 33035040 | 29547602 | 28931044 |
| Office Depot | 28133305 | 28745671 | 28931044 | 29547602 | 33035040 | 29547602 |
| Home Depot   | 27289976 | 28133305 | 28745671 | 28931044 | 29547602 | 33035040 |
| Lowe's       | 27024329 | 27289976 | 28133305 | 28745671 | 28931044 | 29547602 |
| Amazon       | 25315747 | 27024329 | 27289976 | 28133305 | 28745671 | 28931044 |
| WHSmith      | 23200199 | 25315747 | 27024329 | 27289976 | 28133305 | 28745671 |
| Best Buy     | 22927961 | 23200199 | 25315747 | 27024329 | 27289976 | 28133305 |

*/

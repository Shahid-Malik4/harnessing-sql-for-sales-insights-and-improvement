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

*/
SELECT
	c.name AS company,
    SUM(od.total) AS total_sales
FROM orderdetails od
INNER JOIN items i ON od.itemno = i.itemno
INNER JOIN companies c ON i.company = c.name
GROUP BY company
ORDER BY total_sales DESC
LIMIT 10;

/*
*/
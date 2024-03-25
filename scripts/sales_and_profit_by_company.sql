SELECT
	c.name AS company,
    CONVERT(SUM(od.total) / 1000, DECIMAL(10,2)) AS total_sales,
    CONVERT(SUM(od.profit) / 1000, DECIMAL(10,2)) AS total_profit
FROM orderdetails od
INNER JOIN items i ON od.itemno = i.itemno
INNER JOIN companies c ON i.company = c.name
GROUP BY company
ORDER BY total_profit DESC
LIMIT 10;

/*
*/
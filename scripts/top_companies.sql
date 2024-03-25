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
| Company      | Total Sales   |
|--------------|---------------|
| Staples      | 249456994.7900|
| Office Depot | 147250787.8400|
| WHSmith      | 142250078.3300|
| Paperchase   | 102761960.5900|
| Ryman        | 66282793.7300 |
| Walmart      | 64940850.9100 |
| Best Buy     | 52973819.4800 |
| Amazon       | 52661902.0000 |
| Target       | 46306107.8200 |
| OfficeMax    | 39016478.8500 |

*/

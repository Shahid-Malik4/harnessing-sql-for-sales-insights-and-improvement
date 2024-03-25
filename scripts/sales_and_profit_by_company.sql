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
| Company             | Total Sales | Total Profit |
|---------------------|-------------|--------------|
| Staples             | 142250.08   | 16602.71     |
| Office Depot        | 249456.99   | 14103.73     |
| Paper Mate          | 147250.79   | 12392.45     |
| Pilot Pen           | 66282.79    | 11019.77     |
| Bic                 | 64940.85    | 6502.08      |
| Sharpie             | 102761.96   | 6015.74      |
| Crayola             | 46306.11    | 3380.56      |
| 3M                  | 52973.82    | 3037.72      |
| Pentel              | 14401.03    | 3004.19      |
| Avery               | 24909.09    | 2902.52      |

*/

SELECT
	partyname AS party,
    SUM(amount) AS amount
FROM orders
GROUP BY party
ORDER BY amount DESC
LIMIT 10;

/*

*/
SELECT
	p.head AS head,
    SUM(amount) AS amount
FROM orders o
INNER JOIN parties p ON o.partyno = p.partyno
GROUP BY head
ORDER BY amount DESC;

/*

*/
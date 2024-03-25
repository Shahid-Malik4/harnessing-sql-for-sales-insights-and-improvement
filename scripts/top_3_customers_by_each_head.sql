WITH cte AS
(
	SELECT
		o.partyname AS party,
        p.head AS head,
        SUM(o.amount) AS total_amount,
        ROW_NUMBER() OVER(PARTITION BY p.head ORDER BY SUM(o.amount) DESC) AS rnk
	FROM orders o
    INNER JOIN parties p ON o.partyno = p.partyno
    WHERE p.head NOT IN ('Lahore', 'Party')
    GROUP BY head, party
    ORDER BY head
)
SELECT
	party,
    head,
    total_amount,
    rnk as party_rank
FROM cte
WHERE rnk < 4

/*

*/























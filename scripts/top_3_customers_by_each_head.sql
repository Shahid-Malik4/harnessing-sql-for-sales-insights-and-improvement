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
| Party                              | Head         | Total Amount | Party Rank |
|------------------------------------|--------------|--------------|------------|
| OfficeMax                          | Arif Wala    | 18152401     | 1          |
| WHSmith                            | Arif Wala    | 12623920     | 2          |
| Ryman                              | Arif Wala    | 11323045     | 3          |
| Staples                            | Bahawal Nagar| 29547602     | 1          |
| Office Depot                       | Bahawal Nagar| 22605171     | 2          |
| Paperchase                         | Bahawal Nagar| 19435808     | 3          |
| Walmart                            | Darn Wala    | 28745671     | 1          |
| Target                             | Darn Wala    | 20712499     | 2          |
| Costco                             | Darn Wala    | 15088436     | 3          |
| Best Buy                           | Fort Abbas   | 33035040     | 1          |
| Amazon                             | Fort Abbas   | 28133305     | 2          |
| eBay                               | Fort Abbas   | 25315747     | 3          |
| Tesco                              | Haroon Abad  | 3031094      | 1          |
| ASDA                               | Haroon Abad  | 2198105      | 2          |
| Sainsbury's                        | Haroon Abad  | 1807505      | 3          |
| IKEA                               | Hasil Pur    | 28931044     | 1          |
| Home Depot                         | Hasil Pur    | 27289976     | 2          |
| Lowe's                             | Hasil Pur    | 27024329     | 3          |
| Staples                            | Vehari       | 12729184     | 1          |
| Office Depot                       | Vehari       | 6607831      | 2          |
| Paperchase                         | Vehari       | 6571145      | 3          |

*/























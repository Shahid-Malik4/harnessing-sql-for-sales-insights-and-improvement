/*
Question: What are the best selling items?
*/


SELECT
	itemname,
    SUM(total) AS total_amount
FROM
	orderdetails
GROUP BY itemname
ORDER BY total_amount DESC
LIMIT 10;

/*

*/
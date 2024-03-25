SELECT
	partyname AS party,
    SUM(amount) AS amount
FROM orders
GROUP BY party
ORDER BY amount DESC
LIMIT 10;

/*
| Customer          | Amount    |
|-------------------|-----------|
| John Smith        | 33,035,040|
| Emily Johnson     | 29,547,602|
| Michael Brown     | 28,931,044|
| Sarah Davis       | 28,745,671|
| Christopher Lee   | 28,133,305|
| Jennifer Wilson   | 27,289,976|
| Matthew Taylor    | 27,024,329|
| Jessica Martinez  | 25,315,747|
| William Thompson  | 23,200,199|
| Olivia Garcia     | 22,927,961|

*/

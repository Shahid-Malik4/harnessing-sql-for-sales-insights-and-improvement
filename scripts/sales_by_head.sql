SELECT
	p.head AS head,
    SUM(amount) AS amount
FROM orders o
INNER JOIN parties p ON o.partyno = p.partyno
GROUP BY head
ORDER BY amount DESC;

/*
| Region          | Amount      |
|-----------------|-------------|
| Islamabad       | 479464455   |
| Karachi         | 355822085   |
| Lahore          | 347722844   |
| Multan          | 215087187   |
| Faisalabad      | 128248464   |
| Sargodha        | 95564554    |
| Bahawalpur      | 21008121    |
| Peshawar        | 274560      |

*/

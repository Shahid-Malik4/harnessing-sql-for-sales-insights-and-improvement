/*
*/

SELECT
	partyname AS party,
    SUM(CASE WHEN YEAR(date) = 2018 THEN amount ELSE 0 END) AS 2018y,
    SUM(CASE WHEN YEAR(date) = 2019 THEN amount ELSE 0 END) AS 2019y,
    SUM(CASE WHEN YEAR(date) = 2020 THEN amount ELSE 0 END) AS 2020y,
    SUM(CASE WHEN YEAR(date) = 2021 THEN amount ELSE 0 END) AS 2021y,
    SUM(CASE WHEN YEAR(date) = 2022 THEN amount ELSE 0 END) AS 2022y,
    SUM(CASE WHEN YEAR(date) = 2023 THEN amount ELSE 0 END) AS 2023y,
	SUM(amount) AS total_amount
FROM orders
GROUP BY party
ORDER BY total_amount DESC
LIMIT 10;

/*
| party                             | 2018y  | 2019y  | 2020y  | 2021y  | 2022y  | 2023y   | total_amount |
|-----------------------------------|--------|--------|--------|--------|--------|---------|--------------|
| Johnson & Sons                    | 2477013| 5396688| 3375090| 6203504| 7606806| 7975939 | 33035040     |
| Smith Enterprises                 | 3317994| 6281966| 3409193| 4904038| 5334952| 6299459 | 29547602     |
| Harper & Co.                      | 1531239| 4232638| 3427279| 5081637| 6368605| 8289646 | 28931044     |
| Patel Holdings                    | 1565347| 3449001| 2157030| 4570541| 7188820| 9814932 | 28745671     |
| Anderson Group                    | 503157 | 6225899| 3922378| 6216362| 5812042| 5453467 | 28133305     |
| Thompson Enterprises              | 2616472| 4652735| 3122637| 3581541| 5793874| 7522717 | 27289976     |
| Miller Corporation                | 1210149| 3351169| 2228732| 4598107| 7657373| 7978799 | 27024329     |
| Harris & Partners                 | 2262708| 4413487| 2083961| 4257858| 5845251| 6452482 | 25315747     |
| Lewis Holdings                    | 0      | 1853074| 2573787| 4235200| 3734583| 10803555| 23200199     |
| Carter Group                      | 1243678| 3131806| 2174559| 4484895| 5414941| 6478082 | 22927961     |
*/

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
*/
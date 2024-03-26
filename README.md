# Introduction
📊 The project involved comprehensive analysis of sales data extracted from SQL Server, imported into MySQL for data preparation, cleaning, normalization, and in-depth analysis using various SQL commands and functions. The project aimed to derive actionable insights, identify key sales metrics, and explore sales trends using advanced SQL functionalities.


# Background
**Objective:** To perform extensive sales analysis by leveraging MySQL's advanced SQL functionalities, including basic commands, GROUP BY, HAVING, Common Table Expressions (CTE), joins, subqueries, and window functions. The analysis focused on key features such as best-selling items, top-paying customers, sales trends by company, category, territory, time series analysis, and significant KPIs.


### The questions I wanted to answer:

1. What are best selling items?
2. What are top paying customers?
3. What is YTY revenue difference?
4. What are top 3 customers from each Head?
5. What is the ratio of YTY sales company?


# Tools I Used
For my deep dive into the analysis, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **MySQL:** The chosen database management system, ideal for handling the job posting data.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# Project Phases:

### 1. Data Extraction and Preparation in MySQL:
Extracted raw sales data from SQL Server and imported it into MySQL for data cleaning, preparation, and normalization. Conducted data cleaning and normalization to improve performance and reduce redundancy.

### 2. SQL Analysis with Advanced Functionalities:
Utilized a wide array of SQL functionalities for in-depth analysis: Basic SELECT, WHERE, FROM Commands: Extracted specific data subsets based on conditions. Advanced GROUP BY, HAVING: Conducted group-wise aggregations and filtering. Common Table Expressions (CTE): Created temporary result sets for complex queries. Joins and Subqueries: Combined data from multiple tables and performed nested queries. Window Functions (SUM, AVG, RANK, ROW_NUMBER, LEAD, LAG): Calculated aggregated values and performed ranking and analytical operations.

### 3. Key Features and KPI Analysis:
* **Best Selling Item Analysis:** Identified top-performing products based on sales volume or revenue.
* **Top Paying Customers:** Recognized customers contributing the most to overall sales revenue.
Sales Analysis by Company, Category, Territory: Conducted comprehensive sales breakdown across different segments.
* **Time Series Analysis:** Examined sales trends over time, including sales by year and sales/orders trends.
* **Revenue and Profit Over Time:** Analyzed revenue and profit trends to gauge business performance.
* **Key Performance Indicators (KPIs):** Calculated and presented total sales, total profit, total products, total customers, total invoices, and total quantity sold.

### 1. What are best selling items?
```sql
SELECT
	itemname,
    SUM(total) AS total_amount
FROM
	orderdetails
GROUP BY itemname
ORDER BY total_amount DESC
LIMIT 10;
```

Here's the breakdown of query results
- **Sticky Notes**, **Ballpoint Pens** and **Mechanical Pencils** remain top selling items with a great profit margin.

| Item Name                  | Total Amount   |
|----------------------------|----------------|
| Sticky Notes               | 49390909.0000  |
| Ballpoint Pens             | 44105656.2500  |
| Mechanical Pencils         | 37467015.4000  |
| Highlighter Markers        | 34488116.9000  |
| Correction Tape            | 24883336.6400  |
| Fountain Pens              | 23802428.6700  |
| Wooden Pencils             | 23528190.6900  |
| Gel Ink Pens               | 21857564.5000  |
| Whiteboard Markers         | 21678563.2800  |
| Erasers                    | 20326873.3100  |

*Table of the best selling items of all time*

### 2. What are top paying customer's?
```sql
SELECT
	partyname AS party,
    SUM(amount) AS amount
FROM orders
GROUP BY party
ORDER BY amount DESC
LIMIT 10;
```

Here's the breakdown of query results
- Customer's like **John Smith** and **Emily Johnson** remain top paying customers with millions of sales and trade.

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

*Table of the top paying customers of all time*

### 3. What is YTY revenue difference??
```sql
WITH cte AS
(
	SELECT
		YEAR(date) AS year,
        SUM(amount) AS revenue
	FROM orders
    GROUP BY year
)
SELECT
	year,
    revenue,
    LAG(revenue) OVER(ORDER BY year) AS previous_year_revenue,
    revenue - LAG(revenue) OVER(ORDER BY year) AS revenue_difference,
    CONVERT((
		(
			revenue - LAG(revenue) OVER(ORDER BY year)
		) / LAG(revenue) OVER(ORDER BY year) *100
	), DECIMAL(10,2)) AS revenue_difference_precentage
FROM cte
```

Here's the breakdown of query results

- During the early years there was a significant increase in revenue
- In **2020** due to Covid Hit there was a massive drop in revenue.
- From year 2021 to 2023 revenue numbers became better and better

| Year | Revenue    | Previous Year Revenue | Revenue Difference | Revenue Diff Percentage |
|------|------------|-----------------------|--------------------|-------------------------|
| 2018 | 110626690  | null                  | null               | null                    |
| 2019 | 249132001  | 110626690             | 138505311          | 125.20                  |
| 2020 | 162174893  | 249132001             | -86957108          | -34.90                  |
| 2021 | 282142344  | 162174893             | 119967451          | 73.97                   |
| 2022 | 396372938  | 282142344             | 114230594          | 40.49                   |
| 2023 | 463983061  | 396372938             | 67610123           | 17.06                   |

*Table of YTY revenue difference*

### 4. What are top 3 customers from each Head??
```sql
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
```

Here's the breakdown of query results
- **Lahore**,**Krachi** and **Islamabad** have some of the highest paying customers.
- **Bahawalpur** and **Peshawar** on the other hand are least paying regions and need some attention.

| Party                              | Head         | Total Amount | Party Rank |
|------------------------------------|--------------|--------------|------------|
| John Smith                         | Faisalabad   | 18152401     | 1          |
| Michael Brown                      | Faisalabad   | 12623920     | 2          |
| Ryman                              | Faisalabad   | 11323045     | 3          |
| Sarah Davis                        | Islamabad    | 29547602     | 1          |
| Christopher Lee                    | Islamabad    | 22605171     | 2          |
| Emily Johnson                      | Islamabad    | 19435808     | 3          |
| Matthew Taylor                     | Multan       | 28745671     | 1          |
| William Thompson                   | Multan       | 20712499     | 2          |
| Jessica Martinez                   | Multan       | 15088436     | 3          |
| John Miller                        | Lahore       | 33035040     | 1          |
| Jennifer Wilson                    | Lahore       | 28133305     | 2          |
| Cipher Ray                         | Lahore       | 25315747     | 3          |
| Yuri J.                            | Bahawalpur   | 3031094      | 1          |
| Brad Wellock                       | Bahawalpur   | 2198105      | 2          |
| Steve Smith                        | Bahawalpur   | 1807505      | 3          |
| Steven & Co                        | Karachi      | 28931044     | 1          |
| Alex & Son's                       | Karachi      | 27289976     | 2          |
| Lowe's                             | Karachi      | 27024329     | 3          |
| Terry Jones                        | Peshawar     | 12729184     | 1          |
| Dave Clark                         | Peshawar     | 6607831      | 2          |
| Chris J. Smith                     | Peshawar     | 6571145      | 3          |

*Table of top 3 customer from each head*

### 5. What is the ratio of YTY sales by company?
```sql
WITH cte AS
(
	SELECT
		c.name AS company,
        od.total AS total,
        YEAR(o.date) AS year
	FROM orderdetails od
    INNER JOIN orders o ON od.invno = o.invno
    INNER JOIN items i ON od.itemno = i.itemno
    INNER JOIN companies c ON i.company = c.name
)
SELECT
	company,
    CEIL(SUM(CASE WHEN year = 2018 THEN total ELSE 0 END)) AS 2018y,
	CEIL(SUM(CASE WHEN year = 2019 THEN total ELSE 0 END)) AS 2019y,
	CEIL(SUM(CASE WHEN year = 2020 THEN total ELSE 0 END)) AS 2020y,
	CEIL(SUM(CASE WHEN year = 2021 THEN total ELSE 0 END)) AS 2021y,
	CEIL(SUM(CASE WHEN year = 2022 THEN total ELSE 0 END)) AS 2022y,
	CEIL(SUM(CASE WHEN year = 2023 THEN total ELSE 0 END)) AS 2023y
FROM cte
GROUP BY company
ORDER BY 2023y DESC
LIMIT 10;
```

Here's the breakdown of query results
- **ebay** and **Target** make a siginificant increase in sales margin.
- **Best Buy** sales number drop on a massive level

| Company      | 2018y    | 2019y    | 2020y    | 2021y    | 2022y    | 2023y    | 
|--------------|----------|----------|----------|----------|----------|----------|
| ebay         | 27289976 | 29547602 | 28931044 | 28745671 | 28133305 | 33035040 |
| Target       | 28133305 | 33035040 | 29547602 | 28931044 | 28745671 | 29547602 |
| IKEA         | 28745671 | 29547602 | 33035040 | 29547602 | 28931044 | 28931044 |
| Crayola      | 28931044 | 28931044 | 29547602 | 33035040 | 29547602 | 28745671 |
| Office Depot | 29547602 | 28745671 | 28931044 | 29547602 | 33035040 | 28133305 |
| Home Depot   | 30037020 | 28133305 | 28745671 | 28931044 | 29547602 | 27289976 |
| Lowe's       | 29547602 | 27289976 | 28133305 | 28745671 | 28931044 | 27024329 |
| Amazon       | 28931044 | 27024329 | 27289976 | 28133305 | 28745671 | 25315747 |
| WHSmith      | 28745671 | 25315747 | 27024329 | 27289976 | 28133305 | 23200199 |
| Best Buy     | 28133305 | 23200199 | 25315747 | 27024329 | 27289976 | 22927961 |

*Table of the YTY sales by company*

## Conclusion:
The project leveraged MySQL's advanced SQL functionalities to perform a detailed analysis of sales data, deriving valuable insights and key performance indicators. By employing various SQL commands and functions, the project enabled stakeholders to gain a deeper understanding of sales trends, top performers, and crucial business metrics, empowering informed decision-making.

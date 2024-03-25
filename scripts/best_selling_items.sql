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
| Item Name                  | Total Amount   |
|----------------------------|----------------|
| Eco-Friendly Sticky Notes  | 49390909.0000  |
| Fine Point Ballpoint Pens  | 44105656.2500  |
| Mechanical Pencils         | 37467015.4000  |
| Highlighter Markers        | 34488116.9000  |
| Correction Tape            | 24883336.6400  |
| Fountain Pens              | 23802428.6700  |
| Wooden Pencils             | 23528190.6900  |
| Gel Ink Pens               | 21857564.5000  |
| Whiteboard Markers         | 21678563.2800  |
| Erasers                    | 20326873.3100  |
*/

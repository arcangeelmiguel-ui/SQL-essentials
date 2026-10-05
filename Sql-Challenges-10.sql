/******************************************************************************
*******************************************************************************

SQL CHALLENGES 10

*******************************************************************************
******************************************************************************/


USE publications;


-- 1. What's the difference between highest and lowest price of titles
SELECT MAX(price) - MIN(price) AS price_difference
FROM titles;
    
    
-- 2. Find titles where the total number of books sold is an even number.
SELECT title_id, SUM(qty) AS total_sold
FROM sales
GROUP BY title_id
HAVING SUM(qty) % 2 = 0;


-- 3. Calculate the total revenue by multiplying the quantity sold by the price for each title.
SELECT t.title, SUM(s.qty * t.price) AS total_revenue
FROM sales AS s
JOIN titles AS t ON s.title_id = t.title_id
GROUP BY t.title;


-- 4. Cheryl Carson and Charlene Locksley got married, what is their collective revenue?
SELECT SUM(s.qty * t.price) AS collective_revenue
FROM sales AS s
JOIN titles AS t ON s.title_id = t.title_id
JOIN titleauthor AS ta ON t.title_id = ta.title_id
JOIN authors AS a ON ta.au_id = a.au_id
WHERE a.au_lname IN ('Carson', 'Locksley') AND a.au_fname IN ('Cheryl', 'Charlene');

-- Version simple por au_id si sabes los ids:
-- SELECT SUM(s.qty * t.price) AS collective_revenue
-- FROM sales s JOIN titles t ON s.title_id = t.title_id JOIN titleauthor ta ON t.title_id = ta.title_id
-- WHERE ta.au_id IN ('724-80-9391', '486-29-1786');


-- 5. Calculate the total number of books published by the publishers '0736' and '0877':
SELECT pub_id, COUNT(*) AS total_books
FROM titles
WHERE pub_id IN ('0736', '0877')
GROUP BY pub_id;


-- 6. Find all of the books that are more than 10% above the average price of a book in the dataset
SELECT title, price
FROM titles
WHERE price > (SELECT AVG(price) * 1.10 FROM titles);

/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 8

*******************************************************************************
*******************************************************************************


In the exercises below you will need to use the clauses you used in the
previous SQL Challenges, plus the following clauses:
    - Subqueries

*/

USE publications;

/*******************************************************************************
Subqueries

https://dev.mysql.com/doc/refman/8.4/en/subqueries.html
*******************************************************************************/


-- 1. Find the name of the publisher with the highest advance.
SELECT pub_name
FROM publishers
WHERE pub_id = (
    SELECT pub_id
    FROM titles
    ORDER BY advance DESC
    LIMIT 1
);


-- 2. List the titles of books published by publishers based in 'Boston'.
SELECT title
FROM titles
WHERE pub_id IN (
    SELECT pub_id
    FROM publishers
    WHERE city = 'Boston'
);


-- 3. Find the authors who have written more than one book.
SELECT au_id
FROM titleauthor
GROUP BY au_id
HAVING COUNT(*) > 1;

-- Con nombre:
SELECT au_fname, au_lname
FROM authors
WHERE au_id IN (
    SELECT au_id
    FROM titleauthor
    GROUP BY au_id
    HAVING COUNT(*) > 1
);


-- 4. List all authors and the number of books they have written.
SELECT au_id, (
    SELECT COUNT(*)
    FROM titleauthor AS ta
    WHERE ta.au_id = a.au_id
) AS num_books
FROM authors AS a;


-- 5. Find the titles with a price higher than the average price.
SELECT title, price
FROM titles
WHERE price > (
    SELECT AVG(price)
    FROM titles
);


-- 6. Find the name of the publisher who has published the most books.
SELECT pub_name
FROM publishers
WHERE pub_id = (
    SELECT pub_id
    FROM titles
    GROUP BY pub_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);


-- 7. List the titles that have never been sold.
SELECT title
FROM titles
WHERE title_id NOT IN (
    SELECT title_id
    FROM sales
);


-- 8. List all titles along with their publisher's name.
SELECT title, (
    SELECT pub_name
    FROM publishers AS p
    WHERE p.pub_id = t.pub_id
) AS publisher_name
FROM titles AS t;


-- 9. List the employees who have the same job as 'Helen Bennett'.
SELECT fname, lname
FROM employee
WHERE job_id = (
    SELECT job_id
    FROM employee
    WHERE fname = 'Helen' AND lname = 'Bennett'
)
AND NOT (fname = 'Helen' AND lname = 'Bennett');

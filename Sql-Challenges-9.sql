/******************************************************************************
*******************************************************************************

SQL CHALLENGES 9

*******************************************************************************
******************************************************************************/


USE publications;


-- 1. Add a column showing how many characters are in each author's last name
SELECT au_lname, LENGTH(au_lname) AS lname_length
FROM authors;


-- 2. What is the first name of each author in uppercase?
SELECT UPPER(au_fname) AS upper_fname
FROM authors;


-- 3. Combine first and last names of authors into a single column.
SELECT CONCAT(au_fname, ' ', au_lname) AS full_name
FROM authors;


-- 4. Show the current date in a column called 'today'.
SELECT CURDATE() AS today;


-- 5. Calculate the difference in days between a book's publication date and today's date.
SELECT title, pubdate, DATEDIFF(CURDATE(), pubdate) AS days_since_pub
FROM titles;


-- 6. How many years has it been since each title was published?
SELECT title, pubdate, TIMESTAMPDIFF(YEAR, pubdate, CURDATE()) AS years_since_pub
FROM titles;
    
    
-- 7. Find the publication year and month of each title in 'YYYY-MM' format.
SELECT title, DATE_FORMAT(pubdate, '%Y-%m') AS year_month
FROM titles;


-- 8. Concatenate the publisher's name and city into a single column. Separate them with a comma.
SELECT CONCAT(pub_name, ', ', city) AS name_and_city
FROM publishers;


-- 9. What is the longest title of a book?
SELECT title, LENGTH(title) AS title_length
FROM titles
ORDER BY title_length DESC
LIMIT 1;


-- 10. Display the publication date of each title in 'Day-Month-Year' format. For example, '12-June-1991'.
SELECT title, DATE_FORMAT(pubdate, '%d-%M-%Y') AS formatted_date
FROM titles;
    
    
-- 11. List authors whose last name starts with 'C' and show the first 5 characters of their address.
SELECT au_lname, LEFT(address, 5) AS short_address
FROM authors
WHERE au_lname LIKE 'C%';


-- 12. Return the difference in days between the current date and the publication date of titles where the difference is greater than 1000 days.
SELECT title, DATEDIFF(CURDATE(), pubdate) AS days_diff
FROM titles
WHERE DATEDIFF(CURDATE(), pubdate) > 1000;


-- 13. Find the titles where the length of the title name is greater than the average length of all titles.
SELECT title
FROM titles
WHERE LENGTH(title) > (SELECT AVG(LENGTH(title)) FROM titles);


-- 14. Get the authors whose first name length is equal to their last name length.
SELECT au_fname, au_lname
FROM authors
WHERE LENGTH(au_fname) = LENGTH(au_lname);
    

-- 15. Find the longest city name among the authors' addresses.
SELECT city, LENGTH(city) AS city_length
FROM authors
ORDER BY city_length DESC
LIMIT 1;


-- 16. Display titles and their publication dates formatted as 'Day of the Week, Month Day, Year'. For example, 'Wednesday, June 12, 1991'.
SELECT title, DATE_FORMAT(pubdate, '%W, %M %e, %Y') AS formatted_date
FROM titles;
    

-- 17. Calculate the difference in days between the first and last publication date for each author.
SELECT au_id, DATEDIFF(MAX(pubdate), MIN(pubdate)) AS days_between
FROM titleauthor
JOIN titles USING (title_id)
GROUP BY au_id;

/*

*******************************************************************************
*******************************************************************************

SQL CHALLENGES 4

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
        - LIKE (%, _)

--------------------------------------------------------------------------------

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with. */

USE publications;

/*******************************************************************************
LIKE

https://www.w3schools.com/sql/sql_like.asp

Here we will also learn to use some wild card characters:
https://www.w3schools.com/sql/sql_wildcards.asp
(You can ignore 'Wildcard Characters in MS Access'
You need to look at the section 'Wildcard Characters in SQL Server')
*******************************************************************************/

/* 1. Select all books from the table title that contain the word "cooking"
   in its title */
SELECT *
FROM titles
WHERE title LIKE '%cooking%';


-- 2. Select all titles that start with the word "The"
SELECT *
FROM titles
WHERE title LIKE 'The%';


/* 3. Select the full names (first and last name) of authors whose last name
   starts with "S" */
SELECT au_fname, au_lname
FROM authors
WHERE au_lname LIKE 'S%';


/* 4. Select the name and address of all stores located in an Avenue
   (its address ends with "Ave.") */
SELECT stor_name, stor_address
FROM stores
WHERE stor_address LIKE '%Ave.';


/* 5. Select the name and address of all stores located in an Avenue or in a
   Street (address ended in "St.") */
SELECT stor_name, stor_address
FROM stores
WHERE stor_address LIKE '%Ave.' OR stor_address LIKE '%St.';


/* 6. Look at the "employee" table (select all columns to explore the raw data):
   Find a pattern that reveals whether an employee is Female or Male.
   Select all female employees. */
SELECT *
FROM employee
WHERE emp_id LIKE 'F%';


/* 7. Select the first and last names of all male employees whose name starts
   with "P". */
SELECT fname, lname
FROM employee
WHERE emp_id LIKE 'M%' AND fname LIKE 'P%';


/* 8. Select all books that have an "ing" in the title, with at least 4 other
   characters preceding it. For example, 'cooking' has 4 characters before the
   'ing', so this should be included; 'sewing' has only 3 characters before the
   'ing', so this shouldn't be included. */
SELECT *
FROM titles
WHERE title LIKE '%____ing%';


/*


In the exercises below you will need to use the following clauses:
    - IN (NOT IN)
    - BETWEEN (AND)

*/


/*******************************************************************************
IN

https://www.w3schools.com/sql/sql_in.asp
*******************************************************************************/

/* 9. Select the name and state of all stores located in either California (CA)
   or Oregon (OR) */
SELECT stor_name, state
FROM stores
WHERE state IN ('CA', 'OR');


/* 10. Using "IN", select all titles of type "psychology", "mod_cook" and
"trad_cook" */
SELECT *
FROM titles
WHERE type IN ('psychology', 'mod_cook', 'trad_cook');


/* 11. Select all the authors from the author table that do not come from the
cities Salt Lake City, Ann Arbor, and Oakland. */
SELECT *
FROM authors
WHERE city NOT IN ('Salt Lake City', 'Ann Arbor', 'Oakland');


/* The differences between =, LIKE and IN

= :   takes a single value to look for and matches only the exact value.

LIKE: takes a single to look for and allows wildcards (%, _) to match patterns
      in different positions.

IN :  takes many values to look for, such as a list of values, but does not
      work with the wildcards (%, _). */


/*******************************************************************************
BETWEEN

https://www.w3schools.com/sql/sql_between.asp
*******************************************************************************/

/* 12. Select all the order numbers with a quantity sold between 25 and 45 from
   the table sales */
SELECT ord_num
FROM sales
WHERE qty BETWEEN 25 AND 45;


-- 13. Select all the orders between 1993-03-11 and 1994-09-13
SELECT *
FROM sales
WHERE ord_date BETWEEN '1993-03-11' AND '1994-09-13';


/* 14. Select all job descriptions with a maximum level ("max_lvl") between 150
     and 200. */
SELECT job_desc
FROM jobs
WHERE max_lvl BETWEEN 150 AND 200;

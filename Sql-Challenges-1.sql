/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 1

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses:
        - SELECT FROM
    - AS
        - DISTINCT

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

/******************************************************************************
SELECT

https://www.w3schools.com/sql/sql_select.asp
******************************************************************************/

-- 1. Select everything from the table authors
SELECT *
FROM authors;


/* 2. Select everything from the tables "titles", "titleauthor", "publishers"
   and "sales" (one table at a time). Look at the raw data and think about how
   these tables are related to each other. */

SELECT *
FROM titles;

SELECT *
FROM titleauthor;

SELECT *
FROM publishers;

SELECT *
FROM sales;


-- 3. Select the authors first and last name
SELECT au_fname, au_lname
FROM authors;


-- 4. Select the publisher names
SELECT pub_name
FROM publishers;


-- 5. Select the title, price and year-to-date sales of all titles
SELECT title, price, ytd_sales
FROM titles;

/******************************************************************************
AS

https://www.w3schools.com/sql/sql_ref_as.asp
******************************************************************************/

/* 6. Select all the authors first names, but display the column with the
   name "first_name" */
SELECT au_fname AS first_name
FROM authors;


/* 7. Select the job id and job description of all jobs, but display the
   columns with the names "id" and "description" */
SELECT job_id AS id, job_desc AS description
FROM jobs;


/******************************************************************************
DISTINCT

https://www.w3schools.com/sql/sql_distinct.asp
******************************************************************************/

/* 8. Select all unique last names of authors (the same last name cannot appear
   more than once) */
SELECT DISTINCT au_lname
FROM authors;


-- 9. Select all unique title id's that were involved in a sale
SELECT DISTINCT title_id
FROM sales;

# SQL_Project_Practice

Welcome to my SQL practice repository! This project contains a collection of SQL scripts I’ve written as part of my learning and revision process. Each file focuses on a specific SQL concept and its potential use cases.

## File Overview

| File Name                             | Description |
|--------------------------------------|-------------|
| `Beginner - Parks_and_Rec_Create_db.sql` | Basic database creation script |
| `CTE.sql`                            | Common Table Expressions (CTE) usage |
| `Case_statement (When...then...).sql` | Examples using CASE statements |
| `Cleaning_steps.sql`                | Data cleaning using SQL |
| `Conditional_statement-WHERE&LIKE.sql` | Filtering with WHERE and LIKE |
| `Exploratory_Data_Analysis.sql`     | Basic EDA with SQL |
| `GroupBY & OrderBY.sql`             | Grouping and sorting |
| `JOIN.sql`                          | Different types of JOINs |
| `Limit & AS.sql`                    | Using LIMIT and aliasing with AS |
| `Select_tutorial.sql`               | Basic SELECT queries |
| `String_character (important).sql`  | Working with string functions |
| `Sub_queries.sql`                   | Subqueries in SELECT, WHERE, etc. |
| `Temporary_table.sql`              | Creating and using temporary tables |
| `Triggers and Events.sql`           | Triggers and scheduled events |
| `WHERE VS HAVING.sql`             | Conditional statement and in Group By case |
| `UNION & UNION ALL.sql`             | Combining results with UNION |
| `Windows function_OVER()PARTITIONBY().sql`             | Partition By function that group category by rows |
| `Store Procedure & Parameters.sql`             | Store Procedure |


## Purpose

This repository helps me:

- Practice and reinforce SQL concepts.
- Solve real-world data querying problems.
- Prepare for daily uses in a data analyst roles.

## Sample Results and Query

Q1: COMPANY WITH MAXIMUM LAIDOFF EMPLOYEES AND MAXIMUM LAIDOFF PERCENTAGE

Query:
SELECT MAX(total_laid_off), MIN(percentage_laid_off)
FROM layoffs_duplicate
;

Result:
![image](https://github.com/user-attachments/assets/37377a1d-aef7-4e27-9af0-b115beefd99c)


Q2: COMPANY WITH PERCENTAGE LAYOFF OF 100%, WITH DESCENDING ORDER IN FUNDS RAISED

SELECT company, percentage_laid_off,funds_raised_millions
FROM layoffs_duplicate
WHERE percentage_laid_off =1
ORDER BY funds_raised_millions DESC
;

Result:
![image](https://github.com/user-attachments/assets/6daa777f-f3c0-4e74-a0dd-f3e41c68542b)


Q3: SHOWS THE COMPANY WITH THEIR TOTAL LAID OFF FROM ALL DATES, WITH DESCENDING ORDER NUMBER OF PEPS. - GRPUP BY AND SUM()

SELECT company,  SUM(total_laid_off) AS TOTAL_PEPS
FROM layoffs_duplicate
GROUP BY company
ORDER BY TOTAL_PEPS DESC
;

Result:
![image](https://github.com/user-attachments/assets/c1631636-977f-43f8-baa4-ce6e02878418)


Q4: SHOWS THE NUMBER OF TOTAL LAID OFF IN EACH YEAR
SELECT YEAR( date ), SUM(total_laid_off)    # WE CAN SPECIFY YEAR INFRT OF (DATE)
FROM layoffs_duplicate
GROUP BY YEAR( date )
ORDER BY 1 DESC;

Result:
![image](https://github.com/user-attachments/assets/efc31735-5a50-46f5-9231-46e543bef8c9)


Q5: SHOWS THE NUMBER OF TOTAL LAID OFF IN EACH MONTH FOR DIFFERENT YEAR  - SUBSTRING TO SLICE
SELECT SUBSTRING( date ,1,7) AS MONTH, SUM(total_laid_off)
FROM layoffs_duplicate
WHERE SUBSTRING( date ,1,7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC
;

Result:
![image](https://github.com/user-attachments/assets/1fe45f92-59f6-4575-92d6-ad4736094a19)


Q6: ROLLING TOTAL THAT SLOWLY ADDED UP ALONG THE DATE !!! IMPORTANT
WITH Rolling_Total AS (
SELECT SUBSTRING( date ,1,7) AS MONTH, SUM(total_laid_off) AS total_off
FROM layoffs_duplicate
WHERE SUBSTRING( date,1,7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC
)
SELECT MONTH,total_off, SUM(total_off) OVER(ORDER BY MONTH ) AS ro11
FROM Rolling_Total;

Result:
![image](https://github.com/user-attachments/assets/6d326348-e0a3-42f0-85d6-ce40f1dd78d8)


Q7: Show me the total layoff-sum from each company in each year, and order by company name - do it in CTE
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR( date), sum(total_laid_off)
FROM layoffs_duplicate
GROUP BY company, YEAR( date)
), Company_Year_Rank AS (SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking<=5
;

Result:
![image](https://github.com/user-attachments/assets/73fd4f95-eaef-4904-a68b-d668134a8f74)



## User Guide:

If you want to run the SQL files:

1. Set up a local SQL database using MySQL, PostgreSQL, SQLite, or any other RDBMS.
2. Import the SQL files into your SQL IDE.
3. Execute the script and enjoy the result.

## Notes

- The scripts are written primarily for practice and learning purposes.
- Naming conventions and formatting may vary as I explore different styles.
- Feedback and suggestions are always welcome!



Thank You!
---



# Exploratory Data Analysis

SELECT * FROM layoffs_duplicate;

# Q1: COMPANY WITH MAXIMUM LAIDOFF EMPLOYEES AND MAXIMUM LAIDOFF PERCENTAGE

SELECT MAX(total_laid_off), MIN(percentage_laid_off)
FROM layoffs_duplicate
;


# Q2: COMPANY WITH PERCENTAGE LAYOFF OF 100%, WITH DESCENDING ORDER IN FUNDS RAISED

SELECT company, percentage_laid_off,funds_raised_millions
FROM layoffs_duplicate
WHERE percentage_laid_off =1
ORDER BY funds_raised_millions DESC
;

# Q3: SHOWS THE COMPANY WITH THEIR TOTAL LAID OFF FROM ALL DATES, WITH DESCENDING ORDER NUMBER OF PEPS. - GRPUP BY AND SUM()
SELECT company,  SUM(total_laid_off) AS TOTAL_PEPS
FROM layoffs_duplicate
GROUP BY company
ORDER BY TOTAL_PEPS DESC
;


# Q5: SHOWS THE NUMBER OF TOTAL LAID OFF IN EACH YEAR
SELECT YEAR( date ), SUM(total_laid_off)    # WE CAN SPECIFY YEAR INFRT OF (DATE)
FROM layoffs_duplicate
GROUP BY YEAR( date )
ORDER BY 1 DESC;



# ADVANCED: 
# Q6: SHOWS THE NUMBER OF TOTAL LAID OFF IN EACH MONTH FOR DIFFERENT YEAR  - SUBSTRING TO SLICE
SELECT SUBSTRING( date ,1,7) AS MONTH, SUM(total_laid_off)
FROM layoffs_duplicate
WHERE SUBSTRING( date ,1,7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC
;


# Q7: ROLLING TOTAL THAT SLOWLY ADDED UP ALONG THE DATE !!! IMPORTANT
WITH Rolling_Total AS (
SELECT SUBSTRING( date ,1,7) AS MONTH, SUM(total_laid_off) AS total_off
FROM layoffs_duplicate
WHERE SUBSTRING( date,1,7) IS NOT NULL
GROUP BY MONTH
ORDER BY 1 ASC
)
SELECT MONTH,total_off, SUM(total_off) OVER(ORDER BY MONTH ) AS ro11
FROM Rolling_Total;


# Q8: Show me the total layoff-sum from each company in each year, and order by company name - do it in CTE
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



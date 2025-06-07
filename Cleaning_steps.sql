

# Proj 1 -- Full cleaning


# Create schemas/ dataase
# Import tables 
# Data investigation

#	1. Remove Duplicate
#	2. Standardise Datalayoffs
#	3. Null values/ blanks data
#	4. Remove columns (with caution)
#	5. We can also duplicate the tables as test sample. (refer to beginner guide file) - cos we should never work directly on the raw data, but instead on a test sample.



# 1) Remove duplicate
CREATE TABLE `layoffs_duplicate` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
;

INSERT INTO layoffs_duplicate
SELECT *,
ROW_NUMBER() OVER (
  PARTITION BY company, location,
  industry, total_laid_off, percentage_laid_off,
  date, stage, country, funds_raised_millions
  ORDER BY company  -- optional, but ORDER BY is required for ROW_NUMBER
) AS row_num
FROM world_layoff.layoffs;

DELETE 
FROM layoffs_duplicate
WHERE row_num>1;






# 2) Standardisation

UPDATE layoffs_duplicate
SET company=TRIM(company)   # remove space
;


SELECT * FROM layoffs_duplicate
WHERE industry LIKE 'Crypto%'
;
UPDATE layoffs_duplicate
SET industry='Crypto'
WHERE industry LIKE 'Crypto%' # update the CONTENT into same category
;
;


SELECT DISTINCT country 
FROM layoffs_duplicate
ORDER BY 1 DESC
;
UPDATE layoffs_duplicate
SET country = TRIM(TRAILING '.' FROM country) # remove the . specifically from the data. Can be modified
WHERE country LIKE 'United States%' 
;


UPDATE layoffs_duplicate
SET layoffs_duplicate.date = STR_TO_DATE(layoffs_duplicate.date,'%m/%d/%Y')   # STR_TO_DATE is a function that CHANGE THE DATE FORMAT from text to date format in SQL. and we have to arrange the %m,%d,%Y based on the original format of your text date.
; 


ALTER TABLE layoffs_duplicate
MODIFY COLUMN date DATE;   # When you wanna CHANGED THE TYPE of the column. "RMB to not do this in the original table but in the duplicate table

   
SELECT * 
FROM layoffs_duplicate
WHERE industry IS NULL   # Check if the column contain any NULL or just blanks
OR industry=''
;
UPDATE layoffs_duplicate   # It may be a good practice to just set all blanks value into NULL first before doing anything else
SET industry = NULL
WHERE industry =''
;
UPDATE layoffs_duplicate t1
JOIN layoffs_duplicate t2
	ON t1.company = t2.company
SET t1.industry = t2.industry  # fill in the missing NULL value with the similar content that we wanna put in.
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;


DELETE    # When you need to delete certain rows/data that you think is irrelevant
FROM layoffs_duplicate
WHERE total_laid_off IS NULL
AND
percentage_laid_off IS NULL;
;


ALTER TABLE layoffs_duplicate    # When you wanna remove columns
DROP COLUMN row_num
;



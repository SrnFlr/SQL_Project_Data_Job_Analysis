/* 🟩 Problem 1 - CTEs
❓Question:
Identify companies with the most diverse (unique) job titles. Use a CTE to count the number of unique job titles per company, then select companies with the highest diversity in job titles.

🔎 Hints:
Use a CTE to count the distinct number of job titles for each company.
After identifying the number of unique job titles per company, join this result with the company_dim table to get the company names.
Order your final results by the number of unique job titles in descending order to highlight the companies with the highest diversity.
Limit your results to the top 10 companies. This limit helps focus on the companies with the most significant diversity in job roles. Think about how SQL determines which companies make it into the top 10 when there are ties in the number of unique job titles.

💡Solution:
Create a CTE called title_diversity to:
Count unique job titles per company (COUNT(DISTINCT job_title)
From job_postings_fact
Grouping the results by company_id
In the main query:
In SELECT statement get the company names (name) and their corresponding counts of unique job titles from the CTE.
Get data from the CTE title_diversity.
INNER JOIN the CTE with company_dim on company_id to match each company's unique titles count with its name.
ORDER BY companies by descending uniqueness of job titles
LIMIT by the top 10.
-- Define a CTE named title_diversity to calculate unique job titles per company
WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_titles  
    FROM job_postings_fact
    GROUP BY company_id  
)
-- Get company name and count of how many unique titles each company has
SELECT
    company_dim.name,  
    title_diversity.unique_titles  
FROM title_diversity
	INNER JOIN company_dim ON title_diversity.company_id = company_dim.company_id  
ORDER BY 
	unique_titles DESC  
LIMIT 10;  
*/

-- Define a CTE named title_diversity to calculate unique job titles per company
WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_titles  
    FROM job_postings_fact
    GROUP BY company_id  
)
-- Get company name and count of how many unique titles each company has
SELECT
    company_dim.name,  
    title_diversity.unique_titles  
FROM title_diversity
	INNER JOIN company_dim ON title_diversity.company_id = company_dim.company_id  
ORDER BY 
	unique_titles DESC  
LIMIT 10;  

/*  🟩 Problem 1 - CASE Statements
❓Question:
From the job_postings_fact table, categorize the salaries from job postings that are data analyst jobs and who have a yearly salary information. Put salary into 3 different categories:

If the salary_year_avg is greater than $100,000 then return ‘high salary’.
If the salary_year_avg is between $60,000 and $99,999 return ‘Standard salary’.
If the salary_year_avg is below $60,000 return ‘Low salary’.
Also order from the highest to lowest salaries.

🔎 Hint:
In SELECT retrieve these columns: job_id, job_title, salary_year_avg, and a new column for the salary category.
CASE Statement: use to categorize salary_year_avg into 'High salary', 'Standard salary', or 'Low salary'.
If the salary is over $100,000, it's a High salary.
For salaries between $60,000 and $99,999, assign Standard salary.
Any salary below $60,000 should be marked as Low salary.
FROM the job_postings_fact table.
WHERE statement
Exclude records without a specified salary_year_avg.
Focus on job_title_short that exactly matches 'Data Analyst'.
use ORDER BY to sort by salary_year_avg in descending order to start with the highest salaries first.
*/

SELECT
    job_id,
    job_title,
    salary_year_avg,
 /* CASE 
        WHEN salary_year_avg >= 100000 THEN 'High salary'
        WHEN salary_year_avg BETWEEN 60000 AND 99999 THEN 'Standard salary'
        WHEN salary_year_avg < 60000 THEN 'Low salary'
        ELSE 'Low salary'
    END AS salary_category
*/
  CASE 
    WHEN salary_year_avg > 100000 THEN 'High salary'
	WHEN salary_year_avg BETWEEN 60000 and 99999 THEN 'Standard salary'
    WHEN salary_year_avg < 60000 THEN 'Low salary'
  END AS salary_category


FROM 
    job_postings_fact
WHERE 
    salary_year_avg IS NOT NULL
    AND 
    job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;
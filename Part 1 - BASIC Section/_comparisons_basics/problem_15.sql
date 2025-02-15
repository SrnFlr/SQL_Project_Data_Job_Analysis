/*  🟨 Problem 15 - Comparisons
❓Question:

In the job_postings_fact table look at Data Analyst jobs whose average yearly salary range is between $50,000 and $75,000. Return the job_id, job_title_short, job_location and salary_year_avg. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
	job_title_short = 'Data Analyst'
    AND
    salary_year_avg BETWEEN 50000 AND 75000
ORDER BY
    job_id ASC;
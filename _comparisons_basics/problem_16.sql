/* 🟨 Problem 16 - Comparisons
❓Question:

In the job_postings_fact table look at Data Analyst and Business Analyst jobs whose average yearly salary range is greater than $75,000. Return the job_id, job_title_short, job_location, salary_year_avg, and job_schedule_type. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    salary_year_avg,
    job_schedule_type
FROM 
    job_postings_fact
WHERE 
	job_title_short IN ('Data Analyst', 'Business Analyst')
    AND
    salary_year_avg >= 75000
ORDER BY
    job_id ASC;
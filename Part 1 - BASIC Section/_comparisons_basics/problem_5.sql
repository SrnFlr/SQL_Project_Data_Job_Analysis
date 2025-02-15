/* 🟩 Problem 5 - Comparisons
❓Question:

In the job_postings_fact table only get jobs that have an average yearly salary of $65,000 or greater. Also get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order.

*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    salary_year_avg >= 65000
ORDER BY 
    job_id ASC;
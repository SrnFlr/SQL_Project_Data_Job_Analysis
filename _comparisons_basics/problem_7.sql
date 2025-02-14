/* 🟩 Problem 7 - Comparisons
❓Question:

In the job_postings_fact table only get jobs that have an average yearly salary less than $110,000. Also return the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg
FROM job_postings_fact
WHERE salary_year_avg < 110000
ORDER BY job_id ASC;

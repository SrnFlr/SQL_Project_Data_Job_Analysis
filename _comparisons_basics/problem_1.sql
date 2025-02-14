/* 
🟩 Problem 1 - Comparisons
❓ Question:

In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order. Only return rows where the job location is in ‘Tampa, FL’.

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
    job_location = 'Tampa, FL'
ORDER BY
    job_id;
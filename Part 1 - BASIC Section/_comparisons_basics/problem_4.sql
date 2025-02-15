/* 🟩 Problem 4 - Comparisons
❓Question:

In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Order by job_id in ascending order. Only look at jobs that are not posted ‘via LinkedIn’.
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
	NOT job_via = 'LinkedIn'
ORDER BY
    job_id;


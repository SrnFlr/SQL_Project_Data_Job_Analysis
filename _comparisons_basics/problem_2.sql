/* 

🟩 Problem 2 - Comparisons
❓Question:

In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, salary_year_avg, and job_schedule_type columns. Order by job_id in ascending order. Only return ‘Full-time’ jobs.

🔎 Hint:
Look at the job_schedule_type column.

*/

SELECT
    job_id,
    job_schedule_type,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_schedule_type = 'Full-time'
ORDER BY
    job_id;


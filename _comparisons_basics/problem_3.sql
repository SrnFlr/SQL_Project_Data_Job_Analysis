/*
🟩 Problem 3 - Comparisons
❓Question:

In the job_postings_fact table get the job_id, job_title_short, job_location, job_via,  job_schedule_type, and salary_year_avg columns. Order by job_id in ascending order. Only look at jobs that are not ‘Part-time’ jobs.

🔎 Hint:

Look at the job_schedule_type column.

*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    job_schedule_type,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_schedule_type != 'Part-time'
    -- there are several options of writing this WHERE clause :
    -- job_schedule_type != 'Part-time'
    -- job_schedule_type <> 'Part-time'
    -- NOT job_schedule_type = 'Part-time'
ORDER BY job_id;
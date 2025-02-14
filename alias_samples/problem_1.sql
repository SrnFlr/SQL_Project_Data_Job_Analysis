/* 🟩 Problem 1 - Alias
❓Question:
From the job_postings_fact return the following columns: job_id, job_title_short , job_location, job_via, job_posted_date, and salary_year_avg. Also, rename the following: job_via to job_posted_site and salary_year_avg to avg_yearly_salary. Order by job_id in ascending order.
*/


SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via AS job_posted_site, 
    job_posted_date, 
    salary_year_avg AS avg_yearly_salary
FROM 
    job_postings_fact
ORDER BY
    job_id ASC;


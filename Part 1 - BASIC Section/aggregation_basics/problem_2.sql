/*  🟩 Problem 2 - Aggregation
❓Question:
In the job_postings_fact table count the number of job postings available for each country. Return job_country and the job count. Order by job_country in ascending order.

🔎 Hint:
Use the job_country column to group the job postings, and count the number of job postings (job_id) within each country group.

*/

SELECT
    job_country,
    COUNT(job_id) AS job_count
FROM
    job_postings_fact   
GROUP BY 
    job_country
ORDER by
    job_count DESC;



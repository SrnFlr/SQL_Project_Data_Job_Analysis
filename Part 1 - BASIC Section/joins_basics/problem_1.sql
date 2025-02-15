/* 
🟩 Problem 1
JOINs
❓Question:

Retrieve a list of job titles (job_title from the job_posting_fact table) with their corresponding company names (name from the company_dim table). Also, get the job_id, job_location, and job_posted_date. Only return job postings that have the ‘Data Scientist' as the job title (job_title_short). Order by the job posted date in descending order.

🔎 Hint:

Use INNER JOIN to link job_postings_fact with company_dim on company_id to combine job and company data.
Look at job_title_short to use in the WHERE clause.
Use job_posted_date for ORDER BY. Think through how you want it ordered.
Most recent → least recent (descending order)
Least recent → most recent (ascending order)
*/


SELECT 
    job_title,
    companies.name,
    job_id, 
    job_location,
    job_posted_date
FROM 
	job_postings_fact AS j
INNER JOIN company_dim AS companies
	ON j.company_id = companies.company_id
WHERE 
	job_title_short = 'Data Scientist'
ORDER BY
	job_posted_date;
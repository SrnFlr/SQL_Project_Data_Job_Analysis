/*  🟥 Problem 3 - Date Functions
❓Question:
Find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter. And order by the job postings count from highest to lowest.

🔎 Hint:
Join job_postings_fact and company_dim on company_id to match jobs to companies.
Use the WHERE clause to filter for jobs with job_health_insurance column.
Use EXTRACT(QUARTER FROM job_posted_date) to filter for postings in the second quarter.
Group results by company_name.
Count the number of job postings per company with COUNT(job_id).
Use HAVING to include only companies with at least one job posting.
ORDER BY the job postings count in descending order to get highest → lowest.
*/

SELECT
    -- name AS company_name,
    -- COUNT(j.job_id) AS jobs_count
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_postings_count,
    job_posted_date
FROM
    -- job_postings_fact AS j
    -- INNER JOIN company_dim 
    -- ON j.company_id = company_dim.company_id
    job_postings_fact
	INNER JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_health_insurance = TRUE
    -- j.job_posted_date BETWEEN '2023-04-01' AND '2023-06-30'
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 
GROUP BY
    company_dim.name,
    job_posted_date
HAVING
    COUNT( job_postings_fact.job_id) > 0
ORDER BY 
    job_postings_count DESC;


/* 
💡Solution:

Select the company name (name) and count of job postings (COUNT(job_postings_fact.job_id) from the joined tables.
WHERE clause:
Includes health insurance: job_health_insurance is set to TRUE.
Extract the quarter from the job_posted_date and filter for the second quarter (value 2).
GROUP BY the company name (name) to get the count per company.
ORDER BY job postings count in descending order.
SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_postings_count
FROM
    job_postings_fact
	INNER JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.job_health_insurance = TRUE
    AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 
GROUP BY
    company_dim.name 
HAVING
    COUNT(job_postings_fact.job_id) > 0
ORDER BY
	job_postings_count DESC; 

*/
/* 🟩 Problem 1 - Aggregation
❓Question:
In the job_postings_fact table count the total number of job postings that offer health insurance.

🔎 Hint:
Use the job_health_insurance column to determine if a job posting offers health insurance (TRUE means it does offer health insurance).
*/

SELECT
COUNT (*) AS total_job_postings_with_health_insurance 
FROM
	job_postings_fact
WHERE
    job_health_insurance = TRUE;
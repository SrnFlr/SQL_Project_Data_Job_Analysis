/* 🟨 Problem 2 - JOINs
❓Question:
Fetch all job postings, including their job_id, job_title and the names of the skills required (skills); even if no skills are listed for a job. 
Ensure that the job is located in ‘New York’ and offers health insurance. 
Use the job_postings_fact, skills_job_dim, and skills_dim tables. 
Order by job_id in descending order.
🔎 Hint:
Think about what JOIN you want to use for “even if no skills are listed for a job”.
You’ll need to JOIN 2 tables to the job_postings_fact table. skills_job_dim to match the skills with the job and then skills_dim to get the skill name.
In the WHERE clause look at job_location to filter specific job locations and job_health_insurance to see if the company offers health insurance.
*/

SELECT 
    job_title,
    job_location,
    jobs.job_id,
    skills_dim.skills
FROM job_postings_fact AS jobs
LEFT JOIN skills_job_dim 
	ON jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim
	ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
	job_location = 'New York'
    AND
    job_health_insurance IS TRUE
ORDER BY
	jobs.job_id DESC;
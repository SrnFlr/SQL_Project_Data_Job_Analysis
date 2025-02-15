/* 🟥 Problem 3 - JOINs
❓Question:
Identify the top skills required for jobs that offer remote work and have an average yearly salary above $100,000. 
Return the skill name (skills) and the number of job postings that mention each skill, ordered by the number of job postings in descending order.

🔎 Hint:
Use INNER JOIN to connect job_postings_fact with skills_job_dim and skills_dim to relate job postings to skills.
In the WHERE clause use the job_work_from_home and salary_year_avg columns to filter for these two conditions (”offer remote work and have an average yearly salary above $100,000”).
Group results by skill name using GROUP BY.
Sort the results by the count of job postings in descending order with ORDER BY.
*/

SELECT 
	skills_dim.skills,
    COUNT(jobs.job_id) AS numbers
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim ON jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
	salary_year_avg > 100000
    AND
    jobs.job_work_from_home IS TRUE
GROUP BY 
	skills_dim.skills
ORDER BY
	numbers DESC;
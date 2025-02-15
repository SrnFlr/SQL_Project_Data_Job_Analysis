/*🟥 Problem 7 - Aggregation
❓Question:
In the job_postings_fact table list countries along with their average yearly salary (salary_year_avg) for job postings, where the average yearly salary exceeds $100,000. Group the results by job_country. Only get job postings where there is an average yearly salary included (salary_year_avg IS NOT NULL).

🔎 Hint:
To get jobs that have a greater average yearly salary of $100,000, this requires filtering on an aggregate function since you need to count job postings, use HAVING.

*/

SELECT 
	job_country, 
	AVG(salary_year_avg) AS average_salary
FROM 
	job_postings_fact
WHERE 
	salary_year_avg IS NOT NULL
GROUP BY 
	job_country
HAVING 
	AVG(salary_year_avg) > 100000;
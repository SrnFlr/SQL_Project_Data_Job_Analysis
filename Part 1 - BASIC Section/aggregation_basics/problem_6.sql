/* 🟥 Problem 6 - Aggregation
❓Question:
Using the job_postings_fact table find the average, minimum, and maximum salary range for each job_title_short. Only include job titles with more than 1,000 job postings and group data by job_title_short . Order by job_title_short in ascending order.

🔎 Hint:
To get jobs with more than 5 postings this requires filtering on an aggregate function since you need to count job postings, use HAVING.

💡Solution:
Use AVG, MIN, and MAX on salary_year_avg.
In HAVING use COUNT(job_id) > 1000 to only include job titles with more than 1000 postings.
Group by job_title_short.

*/

SELECT 
   job_title_short,
   AVG(salary_year_avg) AS avg_salary,
   MIN(salary_year_avg) AS lowest_avg_salary_offered, 
   MAX(salary_year_avg) AS highest_avg_salary_offered 
FROM 
   job_postings_fact
GROUP BY 
   job_title_short
HAVING 
   COUNT(job_id) > 1000
ORDER BY
   job_title_short;
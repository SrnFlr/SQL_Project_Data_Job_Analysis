/* 🟥 Problem 8 - Aggregation
❓Question:
In the job_postings_fact table count the number of job postings for each location (job_location) that do NOT offer remote work. Display the location and the count of non-remote job postings, and order the results by the count in descending order. Show locations where the average salary for non-remote jobs is above $70,000.

🔎 Hint:
To get jobs that have a greater average yearly salary of $70,000, this requires filtering on an aggregate function since you need to count job postings, use HAVING.

To look at the remote jobs look at the job_work_from_home column.

NOTE: 
If you try to filter out remote work jobs using job_location, you’ll find that Anywhere appears twice, this is due to this column needing to be cleaned up. (I.e., one value has an extra trailing space). So it won’t return the correct results.

*/

SELECT 
  job_location,
  COUNT(job_id) AS not_remote_job_count
FROM 
  job_postings_fact
WHERE 
  job_work_from_home = false
GROUP BY 
  job_location
HAVING 
  AVG(salary_year_avg) > 70000 
ORDER BY 
  not_remote_job_count DESC;
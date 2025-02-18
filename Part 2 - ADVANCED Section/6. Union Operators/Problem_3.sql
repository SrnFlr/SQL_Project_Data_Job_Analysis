/*  🟥 Problem 3 - UNION Operators
❓Question:
Analyze the monthly demand for skills by counting the number of job postings for each skill in the first quarter (January to March), utilizing data from separate tables for each month. Ensure to include skills from all job postings across these months. The tables for the first quarter job postings were created in the Advanced Section - Practice Problem 6 [include timestamp of Youtube video].

🔎 Hints:

Use UNION ALL to combine job postings from January, February, and March into a consolidated dataset.
Apply the EXTRACT function to obtain the year and month from job posting dates, even though the month will be implicitly known from the source table.
Group the combined results by skill to summarize the total postings for each skill across the first quarter.
Join with the skills dimension table to match skill IDs with skill names.

*/
SELECT 
    skills_dim.skills,
    COUNT(job_postings_fact.job_id) AS job_postings_count,
    EXTRACT(MONTH from job_posted_date) AS month
FROM
    job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_posted_date BETWEEN '2023-01-01' AND '2023-03-31'
GROUP BY
    MONTH,
    skills_dim.skills
ORDER BY
    job_postings_count DESC;

/*
💡Solution:

Create a CTE named combined_job_postings to consolidate job postings from the first quarter:
Include job postings from january_jobs, february_jobs, and march_jobs using UNION ALL to ensure all data from these months are combined.
Select job_id and job_posted_date from each month's table, making sure that all postings are captured, including duplicates.
Create a second CTE called monthly_skill_demand to calculate the demand for skills month by month:
In the SELECT statement:
skills to get the skill
Use EXTRACT to pull out the year (EXTRACT(YEAR FROM combined_job_postings.job_posted_date)) and month (EXTRACT(MONTH FROM combined_job_postings.job_posted_date))
COUNT the number of job postings for each skill (COUNT(combined_job_postings.job_id))
Get data FROM the combined_job_postings CTE.
INNER JOIN the combined_job_postings with skills_job_dim on job_id to associate job postings with their required skills.
INNER JOIN the skills_dim on skill_id to get the names and types of the skills.
GROUP BY the skills, year, month
In main query:
Get the skills, year, month, and postings_count
FROM the monthly_skill_demand CTE
Use ORDER BY to sort the results first by skill name (skills), then year, and month


-- CTE for combining job postings from January, February, and March
WITH combined_job_postings AS (
  SELECT job_id, job_posted_date
  FROM january_jobs
  UNION ALL
  SELECT job_id, job_posted_date
  FROM february_jobs
  UNION ALL
  SELECT job_id, job_posted_date
  FROM march_jobs
),
-- CTE for calculating monthly skill demand based on the combined postings
monthly_skill_demand AS (
  SELECT
    skills_dim.skills,  
    EXTRACT(YEAR FROM combined_job_postings.job_posted_date) AS year,  
    EXTRACT(MONTH FROM combined_job_postings.job_posted_date) AS month,  
    COUNT(combined_job_postings.job_id) AS postings_count 
  FROM
    combined_job_postings
	  INNER JOIN skills_job_dim ON combined_job_postings.job_id = skills_job_dim.job_id  
	  INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
  GROUP BY
    skills_dim.skills, year, month
)
-- Main query to display the demand for each skill during the first quarter
SELECT
  skills,  
  year,  
  month,  
  postings_count 
FROM
  monthly_skill_demand
ORDER BY
  skills, year, month; 
  */

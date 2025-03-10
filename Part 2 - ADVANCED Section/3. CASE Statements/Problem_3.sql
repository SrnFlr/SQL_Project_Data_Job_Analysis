/*  🟥 Problem 3 - CASE Statements
❓Question:
Write a query that lists all job postings with their job_id, salary_year_avg, and two additional columns using CASE WHEN statements called: experience_level and remote_option. Use the job_postings_fact table.

For experience_level, categorize jobs based on keywords found in their titles (job_title) as 'Senior', 'Lead/Manager', 'Junior/Entry', or 'Not Specified'. Assume that certain keywords in job titles (like "Senior", "Manager", "Lead", "Junior", or "Entry") can indicate the level of experience required. ILIKE should be used in place of LIKE for this.
NOTE: Use ILIKE in place of how you would normally use LIKE ; ILIKE is a command in SQL, specifically used in PostgreSQL. It performs a case-insensitive search, similar to the LIKE command but without sensitivity to case.
For remote_option, specify whether a job offers a remote option as either 'Yes' or 'No', based on job_work_from_home column.
🔎 Hint:

Use CASE WHEN to categorize data based on conditions.
Look for specific words that indicate job levels, like "Senior", "Manager", "Lead", "Junior", or "Entry". Use ILIKE to ensure the search for keywords is not case-sensitive.
For the remote work option based on job_work_from_home column and look at the boolean value in this column.
*/

SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Lead%' OR job_title ILIKE '%Manager%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No'
    END AS remote_option
FROM job_postings_fact
WHERE 
  salary_year_avg IS NOT NULL 
ORDER BY 
  job_id;
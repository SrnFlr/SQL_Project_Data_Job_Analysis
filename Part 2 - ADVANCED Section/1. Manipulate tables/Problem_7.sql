/*  🟩 Problem 7 - Manipulate Tables
❓Question:
Update the job posting with the job_id = 2 . Update the remote column for this job posting to TRUE in data_science_jobs.

🔎 Hint:
Use SET to specify the column that needs to be updated and the new value for that column.
*/

/* 
💡Solution:
UPDATE data_science_jobs 
SET remote = TRUE WHERE job_id = 2; 
*/

UPDATE data_science_jobs
SET remote = TRUE WHERE job_id = 2;

SELECT * FROM data_science_jobs;
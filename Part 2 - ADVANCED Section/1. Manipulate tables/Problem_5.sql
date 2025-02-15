/* 🟨 Problem 5 - Manipulate Tables
❓Question:
Modify the remote column so that it defaults to FALSE in the data_science_job table .

🔎 Hint:
Use SET DEFAULT command.
*/

ALTER TABLE data_science_jobs
ALTER COLUMN remote SET DEFAULT FALSE;

/*
INSERT INTO data_science_jobs (job_id, job_title, company_name, posted_on)
VALUES
(7, 'Data Scientist', 'Google', '2023-02-05');

SELECT * FROM data_science_jobs;
*/
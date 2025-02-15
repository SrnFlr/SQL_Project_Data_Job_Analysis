/* 🟩 Problem 4 - Manipulate Tables
❓Question:
Rename the post_date column to posted_on from the data_science_job table. 

*/

ALTER TABLE data_science_jobs
RENAME COLUMN post_date to posted_on;

SELECT * FROM data_science_jobs;
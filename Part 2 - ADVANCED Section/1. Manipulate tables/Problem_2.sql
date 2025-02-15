/* 
🟩 Problem 2 - Manipulate Tables
Insert three job postings into the data_science_jobs table. Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date.

Example data to insert:

*/

INSERT INTO data_science_jobs (job_id, job_title, company_name, post_date)
VALUES 
(4, 'Data Scientist', 'Tech Innovations', '2023-01-01'),
(5, 'Machine Learning Engineer', 'Data Driven Co', '2023-01-15'),
(6, 'AI Specialist', 'Future Tech', '2023-02-01');

SELECT * FROM data_science_jobs;
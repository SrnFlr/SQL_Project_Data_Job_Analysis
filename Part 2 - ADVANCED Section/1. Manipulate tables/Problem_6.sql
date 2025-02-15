/* 
🟩 Problem 6 - Manipulate Tables
❓Question:
Drop the company_name column from the data_science_jobs table.
*/

/* Syntax order error
DROP COLUMN company_name
FROM data_science_jobs;
*/

-- The correct form is: 

ALTER TABLE data_science_jobs 
DROP COLUMN company_name;

SELECT * FROM data_science_jobs;
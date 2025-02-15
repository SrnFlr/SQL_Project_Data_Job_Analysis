/* 🟩 Problem 1 - Manipulate Tables
❓Question:
Create a table named data_science_jobs that will hold information about job postings. Include the following columns: job_id (integer and primary key), job_title (text), company_name (text), and post_date (date).
 */

CREATE TABLE IF NOT EXISTS data_science_jobs (
    job_id INTEGER PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
)
/* 🟩 Problem 12 - Comparisons
❓Question:

Rewrite the same query from the last problem but using the BETWEEN operator.
*/

SELECT 
    job_id, 
    job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
	salary_year_avg BETWEEN 50000 AND 70000
ORDER BY
    job_id ASC;
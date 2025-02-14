/* 
Find all job postings in the job_postings_fact where the job_title includes "Engineer" in it with ONLY one character followed after the term. 
Get the job_id , job_title, and job_posted_date. Order by job_id in ascending order.
*/

SELECT 
    job_id, 
    job_title,
    job_posted_date
FROM 
    job_postings_fact
WHERE 
	job_title LIKE '%Engineer_'
ORDER BY
    job_id ASC;
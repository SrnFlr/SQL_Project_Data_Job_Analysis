/* 🟨 Problem 2 - Subqueries
❓Question:
Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying the number of job postings they have. Use a subquery to calculate the total job postings per company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings. Implement a subquery to aggregate job counts per company before classifying them based on size.

🔎 Hints:
Aggregate job counts per company in the subquery. This involves grouping by company and counting job postings.
Use this subquery in the FROM clause of your main query.
In the main query, categorize companies based on the aggregated job counts from the subquery with a CASE statement.
The subquery prepares data (counts jobs per company), and the outer query classifies companies based on these counts.
*/

SELECT
    company_dim.name AS company_name,
    job_postings_count,
    CASE
        WHEN job_postings_count < 10 THEN 'Small'
        WHEN job_postings_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM
    company_dim
    INNER JOIN (
        SELECT
            company_id,
            COUNT(job_id) AS job_postings_count
        FROM
            job_postings_fact
        GROUP BY
            company_id
    ) AS job_counts
    ON company_dim.company_id = job_counts.company_id
ORDER BY
    job_postings_count DESC;

/* 🟥 Problem 3 - Subqueries
❓Question:
Find companies that offer an average salary above the overall average yearly salary of all job postings. Use subqueries to select companies with an average salary higher than the overall average salary (which is another subquery).

🔎 Hints:

Start by separating the task into two main steps:
- calculating the overall average salary
- identifying companies with higher averages.
Use a subquery (subquery 1) to find the average yearly salary across all job postings. Then join this subquery onto the company_dim table.

Use another a subquery (subquery 2) to establish the overall average salary, which will help in filtering in the WHERE clause companies with higher average salaries.
Determine each company's average salary (what you got from the subquery 1) and compare it to the overall average you calculated (subquery 2). Focus on companies that greater than this average.

Problem 3 - Subqueries
💡Solution:

Select the company names (name) from the company_dim table to identify the companies.
INNER JOIN the company_dim table with a subquery:
selects the company_id and the average of salary_year_avg
from the job_postings_fact table,
grouping the results by company_id.
Name this subquery as company_salaries, which now holds the average salary information per company
JOIN on company_id
In the WHERE clause of your main query, include another subquery that:
In the SELECT calculates the overall average salary across all job postings (AVG(salary_year_avg)) from the job_postings_fact table.
Compare each company's average salary (company_salaries subquery) to the overall average salary determined by the second subquery; average salary is greater than this overall average. */

SELECT 
    company_dim.name,
    company_salaries.avg_salary
FROM 
    company_dim
INNER JOIN (
    -- Subquery to calculate average salary per company
    SELECT 
			company_id, 
			AVG(salary_year_avg) AS avg_salary
    FROM job_postings_fact
    GROUP BY company_id
    ) AS company_salaries ON company_dim.company_id = company_salaries.company_id
-- Filter for companies with an average salary greater than the overall average
WHERE company_salaries.avg_salary > (
    -- Subquery to calculate the overall average salary
    SELECT 
        AVG(salary_year_avg)
    FROM 
        job_postings_fact
);
/* Diff between average salary of each company and overall average salary : 
I think the issue there is your second subquery.
Your code basically checks if the average salary of each company is greater than the average salary of each company.
For the second subquery, just remove the company_id and GROUP BY so that it will just check the overall average salary. In that way, the code will check if the average salary of each company(subquery 1) is greater than the overall average salary(subquery 2). Hope this explanation helps!
*/
/* 🟨 Problem 4 - Aggregation
❓Question:
In the job_postings_fact table find the minimum and maximum yearly salaries (salary_year_avg) offered for job postings in locations that include ‘San Francisco’ in the location title. The query should return two columns: one for the minimum yearly salary and one for the maximum yearly salary, considering only job postings that specify a yearly salary (salary_year_avg IS NOT NULL).

🔎 Hint:
To be more accurate use LIKE when searching for the location. In case locations aren’t in a specific format like `San Francisco, CA'.

*/

SELECT
    MIN(salary_year_Avg) AS min_salary,
    MAX(salary_year_avg) AS max_salary
FROM
    job_postings_fact
WHERE
    job_location LIKE '%San Francisco%'
    AND
    salary_year_avg IS NOT NULL;







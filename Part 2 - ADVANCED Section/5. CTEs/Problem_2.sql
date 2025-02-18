/* 🟨 Problem 2
CTEs
❓Question:

Explore job postings by listing job id, job titles, company names, and their average salary rates, while categorizing these salaries relative to the average in their respective countries. Include the month of the job posted date. Use CTEs, conditional logic, and date functions, to compare individual salaries with national averages.

🔎 Hints:

Define a CTE to calculate the average salary for each country. This will serve as a foundational dataset for comparison.
Within the main query, use a CASE WHEN statement to categorize each salary as 'Above Average' or 'Below Average' based on its comparison (>) to the country's average salary calculated in the CTE.
To include the month of the job posting, use the EXTRACT function on the job posting date within your SELECT statement.
Join the job postings data (job_postings_fact) with the CTE to compare individual salaries to the average. Additionally, join with the company dimension (company_dim) table to get company names linked to each job posting.


💡Solution:

Create Common Table Expression (CTE) named avg_salaries

Calculate the average yearly salary (AVG(salary_year_avg)) for each country (job_country)
From the job_postings_fact table,
Grouping the results by job_country.

In the main query:
Select:
the job_id, job_title, and company name (companies.name) to get the basic job posting information.
Retrieve the salary (salary_year_avg) for each job posting and label it as salary_rate.
Categorize each salary as 'Above Average' or 'Below Average' by comparing the individual salary rate to the average salary of the corresponding country obtained from the avg_salaries CTE (job_postings.salary_year_avg > avg_salaries.avg_salary)
Extract the month from the job posting date (job_posted_date) to include in your results as posting_month.
INNER JOIN the job_postings_fact table with the company_dim table to link each job posting with the respective company name.
INNER JOIN the avg_salaries CTE to bring in the average salary data for comparison.
Order the results by the posting_month in descending order to sort the job postings starting with the most recent.
*/


-- gets average job salary for each country
WITH avg_salaries AS (
  SELECT 
    job_country, 
    AVG(salary_year_avg) AS avg_salary
  FROM job_postings_fact
  GROUP BY job_country
)

SELECT
  -- Gets basic job info
    job_postings.job_id,
    job_postings.job_title,
    companies.name AS company_name,
    job_postings.salary_year_avg AS salary_rate,
-- categorizes the salary as above or below average the average salary for the country
  CASE
    WHEN job_postings.salary_year_avg > avg_salaries.avg_salary
    THEN 'Above Average'
    ELSE 'Below Average'
  END AS salary_category,
  -- gets the month and year of the job posting date
  EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month
FROM
  job_postings_fact as job_postings
INNER JOIN
  company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
  avg_salaries ON job_postings.job_country = avg_salaries.job_country
ORDER BY
    -- Sorts it by the most recent job postings
    posting_month desc
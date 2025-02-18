/* 🟥 Problem 3 - CTEs
❓Question:

Calculate the number of unique skills required by each company. Aim to quantify the unique skills required per company and identify which of these companies offer the highest average salary for positions necessitating at least one skill. For entities without skill-related job postings, list it as a zero skill requirement and a null salary. Use CTEs to separately assess the unique skill count and the maximum average salary offered by these companies.

🔎 Hints:
Use two CTEs.
The first should focus on counting the unique skills required by each company.
The second CTE should aim to find the highest average salary offered by these companies.
Ensure the final output includes companies without skill-related job postings. This involves use of LEFT JOINs to maintain companies in the result set even if they don't match criteria in the subsequent CTEs.
After creating the CTEs, the main query joins the company dimension table with the results of both CTEs.
=======

💡Solution:

Start with a CTE named required_skills
Count the distinct skills (COUNT(DISTINCT skills_to_job.skill_id)) required by each company (company_id).
Then LEFT JOIN the company_dim with job_postings_fact and skills_job_dim tables, ensuring even companies with no skills-related job postings are included.
GROUP BY the company_id

Create a second CTE called max_salary
Get the highest average yearly salary (MAX(job_postings.salary_year_avg)) offered by companies (company_id)
Only get jobs that require at least one skill by filtering out job postings that have an associated skill in the skills_job_dim table (job_postings.job_id IN (SELECT job_id FROM skills_job_dim))
GROUP BY the company_id
In the main query
SELECT the company names (name) from the company_dim table, unique_skills_required from required_skills CTE, and highest_average_salary from the max_salary CTE
Get information FROM the company_dim table.
LEFT JOIN the company_dim table with the required_skills CTE to bring in the count of unique skills required by each company.
LEFT JOIN the company_dim table with the max_salary CTE to include the highest average salary offered by these companies.
ORDER BY the company names in ascending order.


-- Start with a CTE named required_skills

WITH required_skills AS (
    SELECT company_dim.company_id,
        COUNT(DISTINCT skills_job_dim.skill_id) AS unique_skills_required
    FROM company_dim
    LEFT JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    GROUP BY company_dim.company_id
),

--Create a second CTE called max_salary

WITH max_salary AS (
    SELECT company_dim.company_id,
    MAX(job_postings_fact.salary_year_avg) AS highest_average_salary
    FROM company_dim
    LEFT JOIN job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
    WHERE job_postings_fact.job_id IN (SELECT job_id FROM skills_job_dim)
    GROUP BY company_dim.company_id
),
-- Main query
SELECT 
    company_dim.name,
    required_skills.unique_skills_required,
    max_salary.highest_average_salary
FROM 
    company_dim
    LEFT JOIN required_skills ON company_dim.company_id = required_skills.company_id
    LEFT JOIN max_salary ON company_dim.company_id = max_salary.company_id
ORDER BY 
    company_dim.name ASC;
*/

-- Counts the distinct skills required for each company's job posting
WITH required_skills AS (
  SELECT
    companies.company_id,
    COUNT(DISTINCT skills_to_job.skill_id) AS unique_skills_required
  FROM
    company_dim AS companies 
  LEFT JOIN job_postings_fact as job_postings ON companies.company_id = job_postings.company_id
  LEFT JOIN skills_job_dim as skills_to_job ON job_postings.job_id = skills_to_job.job_id
  GROUP BY
    companies.company_id
),
-- Gets the highest average yearly salary from the jobs that require at least one skills 
max_salary AS (
  SELECT
    job_postings.company_id,
    MAX(job_postings.salary_year_avg) AS highest_average_salary
  FROM
    job_postings_fact AS job_postings
  WHERE
    job_postings.job_id IN (SELECT job_id FROM skills_job_dim)
  GROUP BY
    job_postings.company_id
)
-- Joins 2 CTEs with table to get the query
SELECT
  companies.name,
  required_skills.unique_skills_required as unique_skills_required, --handle companies w/o any skills required
  max_salary.highest_average_salary
FROM
  company_dim AS companies
LEFT JOIN required_skills ON companies.company_id = required_skills.company_id
LEFT JOIN max_salary ON companies.company_id = max_salary.company_id
ORDER BY
	companies.name;
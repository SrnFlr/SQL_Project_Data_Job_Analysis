/* 🟩 Problem 1 - Subqueries
❓Question:
Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table and then join this result with the skills_dim table to get the skill names.

🔎 Hints:
Focus on creating a subquery that identifies and ranks (ORDER BY in descending order) the top 5 skill IDs by their frequency (COUNT) of mention in job postings.
Then join this subquery with the skills table (skills_dim) to match IDs to skill names.

*/

-- Subquery to find the top 5 skill IDs with the highest counts
SELECT
    skill_id,
    COUNT(skill_id) AS skill_count
FROM
    skills_job_dim
GROUP BY
    skill_id
ORDER BY
    skill_count DESC
LIMIT 5;

-- Join the subquery with the skills table to get the skill names
SELECT
    s.skills,
    sub.skill_count
FROM (
    SELECT
        skill_id,
        COUNT(skill_id) AS skill_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY
        skill_count DESC
    LIMIT 5
) AS sub
INNER JOIN skills_dim AS s ON sub.skill_id = s.skill_id;

-- 🟩 Solution :
SELECT 
skills_dim.skills,
top_skills.skill_count
FROM skills_dim
INNER JOIN (
    SELECT 
       skill_id,
       COUNT(job_id) AS skill_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(job_id) DESC
    LIMIT 5
) AS top_skills ON skills_dim.skill_id = top_skills.skill_id
ORDER BY top_skills.skill_count DESC;
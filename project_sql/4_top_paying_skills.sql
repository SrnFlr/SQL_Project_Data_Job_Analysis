/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0 )AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;

/* 
Analyse via ChatGPT :
Insights on the Top-Paying Skills for Data Analysts
Big Data & Cloud Dominate the Top Spots

PySpark ($208K), Databricks ($141K), Couchbase ($160K), Elasticsearch ($145K), Airflow ($126K), and GCP ($122K) are all crucial for handling large-scale data processing, pipelines, and cloud computing.
Companies are paying a premium for professionals who can work with distributed computing and cloud-based data solutions.
Version Control & DevOps Integration is Key

Bitbucket ($189K), GitLab ($154K), Jenkins ($125K), and Atlassian ($131K) show that data teams highly value CI/CD, automation, and version control.
This suggests that data analysts are increasingly expected to integrate their work into engineering workflows.
Machine Learning & AI Skills Pay Well

DataRobot ($155K), Scikit-learn ($125K), Numpy ($143K), Pandas ($151K), Jupyter ($152K) are core to ML and data science.
Even in traditional analyst roles, ML expertise gives a competitive salary boost.
Programming Languages & Frameworks Matter

Swift ($153K), Golang ($145K), Scala ($124K), Kubernetes ($132K) suggest that backend and system programming skills can complement data analysis for higher pay.
SQL-based tools like PostgreSQL ($123K) remain highly valued.
BI & Data Visualization Tools in the Mix

MicroStrategy ($121K) and Notion ($125K) suggest that traditional BI tools still offer strong earning potential.
Key Takeaways
Data professionals who specialize in big data, ML, and cloud platforms earn significantly higher salaries.
Engineering skills (DevOps, version control, automation) are becoming essential for top-paying roles.
Programming expertise in Python, Scala, and Golang can set analysts apart in high-paying positions.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/
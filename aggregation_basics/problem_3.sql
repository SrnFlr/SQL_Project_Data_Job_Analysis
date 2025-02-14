/* 🟨 Problem 3 - Aggregation
❓Question:
In the job_postings_fact table calculate the total sum of the average yearly salary (salary_year_avg) for all job postings that are marked as fully remote and divide it by the total count of salary_year_avg. To get the total average yearly salary for fully remote jobs. Ensure to only include job postings where a yearly salary is specified (salary_year_avg IS NOT NULL).

🔎 Hint:
To find jobs that are fully remote look at the values in job_work_from_home column.
Only include job postings where a yearly salary is specified (WHERE salary_year_avg IS NOT NULL).
NOTE: If you’re following along in the video we’ll cover IS NOT NULL here shortly

*/
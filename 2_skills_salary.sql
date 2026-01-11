SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary_skill
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title LIKE '%Data_Analyst%' AND
    (job_country = 'Mexico' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY average_salary_skill DESC;
WITH top_paying AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title LIKE '%Data_Analyst%' AND
        (job_country = 'Mexico' OR job_location = 'Anywhere') AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 50)

SELECT
    skills_dim.skills,
    COUNT(top_paying.job_id) AS number_of_jobs,
    ROUND(AVG(top_paying.salary_year_avg), 2) AS average_salary_skill
FROM top_paying
INNER JOIN skills_job_dim ON top_paying.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_dim.skills
ORDER BY number_of_jobs DESC;
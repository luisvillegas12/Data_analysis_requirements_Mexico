--Revisar aquellos valores que pudieran alterar la media
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Data_Analyst%' AND
    (job_country = 'Mexico' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;



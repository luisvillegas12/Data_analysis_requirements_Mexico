CREATE OR REPLACE VIEW title_payment AS (
SELECT
    ROUND(AVG(salary_year_avg) FILTER (WHERE job_no_degree_mention = TRUE),2) AS average_salary_WITHOUT_degree,
    ROUND(AVG(salary_year_avg) FILTER (WHERE job_no_degree_mention = FALSE),2) AS average_salary_with_degree
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Data_Analyst%' AND
    (job_country = 'Mexico' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL);

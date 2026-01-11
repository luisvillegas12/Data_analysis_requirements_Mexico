CREATE OR REPLACE VIEW employers_per_country AS (
SELECT
    job_country,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
FROM job_postings_fact
WHERE
    job_title LIKE '%Data_Analyst%' AND
    salary_year_avg IS NOT NULL AND
    job_country IS NOT NULL
GROUP BY job_country
ORDER BY average_salary DESC);
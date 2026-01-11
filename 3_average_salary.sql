CREATE OR REPLACE VIEW average_salary AS (
SELECT
    ROUND(avg(salary_year_avg),2) AS average_salary
FROM
    job_postings_fact
WHERE
    job_title LIKE '%Data_Analyst%' AND 
    job_no_degree_mention = FALSE AND
    (job_country = 'Mexico' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL);
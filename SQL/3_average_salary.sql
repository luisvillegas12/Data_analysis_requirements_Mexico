CREATE OR REPLACE VIEW average_salary AS (
WITH salary_stats AS (
    SELECT 
        avg(salary_year_avg) as global_avg,
        stddev(salary_year_avg) as global_stddev
    FROM 
        job_postings_fact
    WHERE 
        job_title LIKE '%Data Analyst%' AND 
        job_no_degree_mention = FALSE AND
        (job_country = 'Mexico' OR job_location = 'Anywhere') AND
        salary_year_avg IS NOT NULL
)
SELECT
    ROUND(avg(salary_year_avg), 2) AS average_salary
FROM
    job_postings_fact, 
    salary_stats
WHERE
    job_title LIKE '%Data Analyst%' AND 
    job_no_degree_mention = FALSE AND
    (job_country = 'Mexico' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL AND
-- Filtro con 3 desviaciones estándar para cubrir 99.7% de los resultados
    salary_year_avg BETWEEN (global_avg - 2 * global_stddev) 
                        AND (global_avg + 2 * global_stddev)
);
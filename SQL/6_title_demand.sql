CREATE OR REPLACE VIEW title_demand AS (
SELECT
    COUNT(*) FILTER (WHERE job_no_degree_mention = TRUE)
        AS jobs_without_degree_mention,

    COUNT(*) FILTER (WHERE job_no_degree_mention = FALSE)
        AS jobs_with_degree_mention
FROM job_postings_fact
WHERE 
    job_title LIKE '%Data_Analyst%' AND
    (job_country = 'Mexico' OR job_location = 'Anywhere'));
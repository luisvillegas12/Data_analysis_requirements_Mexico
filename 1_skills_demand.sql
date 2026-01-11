CREATE OR REPLACE VIEW top_demanded_skills AS (
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title LIKE '%Data_Analyst%' AND
    (job_country = 'Mexico' OR job_location = 'Anywhere')
GROUP BY skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) >= 1000
ORDER BY demand_count DESC);

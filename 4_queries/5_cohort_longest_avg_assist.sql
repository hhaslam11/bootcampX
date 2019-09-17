SELECT cohorts.name AS name,
       AVG(completed_at - started_at) AS avg_assist_time

FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = students.cohort_id

GROUP BY cohorts.name
ORDER BY avg_assist_time DESC
LIMIT 1;
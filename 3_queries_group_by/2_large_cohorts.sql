SELECT cohorts.name AS cohort_name, COUNT(students.id) AS student_count
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
GROUP BY cohorts.id
HAVING COUNT(students.id) >= 18
ORDER BY COUNT(students.id);

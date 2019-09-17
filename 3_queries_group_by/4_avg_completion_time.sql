SELECT name AS student, AVG(assignment_submissions.duration) AS avg_assignment_duration
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
WHERE students.end_date IS NULL
GROUP BY name
ORDER BY AVG(assignment_submissions.duration) DESC;


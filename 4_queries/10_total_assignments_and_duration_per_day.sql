SELECT day,
       COUNT(*) AS number_of_assignments,
       SUM(duration) AS duration

FROM assignents
GROUP BY day
ORDER BY day;
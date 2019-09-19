const args = process.argv[2];
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: 123,
  host: 'localhost',
  database:  'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name AS teacher,
                cohorts.name  AS cohort,
                COUNT(assistance_requests) AS total_assistances

FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts  ON cohorts.id  = students.cohort_id
JOIN teachers ON teachers.id = assistance_requests.teacher_id

WHERE cohorts.name = '${args}'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`)
  .then(res => {
    console.log(res.rows);
  });

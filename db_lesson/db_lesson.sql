SELECT
  *
FROM
  people
INNER JOIN
  reports
ON
  people.person_id = reports.person_id;
SELECT users.id, users.name, courses.name AS course, schools.name AS school, educations."endDate"
FROM educations
    JOIN users
        ON users.id = educations."userId"
    JOIN courses
        ON courses.id = educations."courseId"
    JOIN schools
        ON schools.id = educations."schoolId"
WHERE users.id = 30
    AND educations.status = 'finished';
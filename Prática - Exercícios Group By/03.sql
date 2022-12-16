SELECT u.name AS writer, COUNT(t."writerId") AS "testimonialCount"             
    FROM users as u
        JOIN testimonials AS t 
            ON t."writerId" = u.id
    WHERE u.id = 435
        GROUP BY u.id;
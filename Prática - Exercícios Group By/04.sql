SELECT MAX(j.salary) AS "maximumSalary", r.name as role
    FROM jobs as j
        JOIN roles as r
            ON r.id = j."roleId"
    GROUP BY role           
        ORDER BY "maximumSalary";
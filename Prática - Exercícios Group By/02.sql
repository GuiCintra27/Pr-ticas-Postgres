SELECT "userId", COUNT("endDate") AS educations 
FROM educations
GROUP BY "userId"
ORDER BY educations DESC;
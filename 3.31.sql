SELECT c.class
FROM classes c
 LEFT JOIN (
 SELECT class, name
 FROM ships
 UNION
 SELECT ship, ship
 FROM outcomes
) AS s ON s.class = c.class
GROUP BY c.class
HAVING COUNT(s.name) = 1